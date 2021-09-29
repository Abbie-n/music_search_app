import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_search_app/core/blocs/info/info_bloc.dart';
import 'package:music_search_app/utils/app/colors.dart';
import 'package:music_search_app/utils/widgets/subWidgets.dart';
import 'package:music_search_app/utils/widgets/text_widget.dart';
import 'package:music_search_app/views/baseScreen.dart';
import 'package:http/http.dart' as http;

class AlbumDetailsScreen extends StatefulWidget {
  final String? album;
  final String? artist;

  const AlbumDetailsScreen({
    Key? key,
    this.album,
    this.artist,
  }) : super(key: key);

  @override
  _AlbumDetailsScreenState createState() => _AlbumDetailsScreenState();
}

class _AlbumDetailsScreenState extends State<AlbumDetailsScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final formKey = GlobalKey<FormState>();
  InfoBloc _bloc = InfoBloc();

  String? searchString = '';
  bool done = false;
  @override
  void initState() {
    super.initState();
    _bloc = InfoBloc(
        httpClient: http.Client(), album: widget.album, artist: widget.artist);
    setState(() {
      done = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              backButton(context),
              const SizedBox(width: 20),
              regularText(
                context,
                text: 'Album details',
                color: AppColors.primaryBlue,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          const SizedBox(height: 20),
          !done
              ? const Center(
                  child: Text(
                    'You haven\'t search for data yet 🙂',
                    style: TextStyle(fontSize: 15),
                  ),
                )
              : Expanded(
                  child: BlocProvider(
                    create: (_) => _bloc..add(DataFetched()),
                    child: BlocBuilder<InfoBloc, InfoState>(
                      builder: (context, state) {
                        switch (state.status) {
                          case InfoStatus.failure:
                            return const Center(
                              child: Text('Failed to fetch data'),
                            );
                          case InfoStatus.success:
                            if (state.data.toString().length < 1) {
                              return const Center(
                                child: Text('No data'),
                              );
                            }
                            break;
                          default:
                            return Center(
                              child: const Text('Loading...'),
                            );
                        }
                        var _data = state.data.album;
                        return Container(
                          constraints:
                              BoxConstraints(maxHeight: double.infinity),
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 300,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      '${_data!.image![3].text}',
                                    ),
                                    fit: BoxFit.fitWidth,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              const SizedBox(height: 20),
                              RichText(
                                text: TextSpan(
                                  text: 'Album name: ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.darkTextGrey,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '${_data.name}',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.darkTextGrey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              RichText(
                                text: TextSpan(
                                  text: 'Artist: ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.darkTextGrey,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '${_data.artist}',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.darkTextGrey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              RichText(
                                text: TextSpan(
                                  text: 'Plays: ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.darkTextGrey,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '${_data.playcount}',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.darkTextGrey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              RichText(
                                text: TextSpan(
                                  text: 'Listeners: ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.darkTextGrey,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '${_data.listeners}',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.darkTextGrey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              RichText(
                                text: TextSpan(
                                  text: 'Total tracks: ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.darkTextGrey,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '${_data.tracks!.track!.length}',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.darkTextGrey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
