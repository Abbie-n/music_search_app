import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_search_app/core/blocs/search/search_bloc.dart';
import 'package:music_search_app/utils/app/colors.dart';
import 'package:music_search_app/utils/helper.dart';
import 'package:music_search_app/utils/widgets/text_field.dart';
import 'package:music_search_app/utils/widgets/text_widget.dart';
import 'package:music_search_app/views/album_details.dart';
import 'package:music_search_app/views/baseScreen.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final formKey = GlobalKey<FormState>();

  String? searchString = '';
  bool done = false;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          regularText(
            context,
            text: Helper.greeting(),
            color: AppColors.primaryBlue,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(
            height: 10,
          ),
          regularText(
            context,
            text: 'Search for your fave albums',
            color: AppColors.textGrey,
            letterSpacing: 0.8,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
            hintText: 'Explore',
            suffixIcon: IconButton(
                onPressed: () => setState(() {
                      done = true;
                    }),
                icon: Icon(Icons.search)),
            onChanged: (value) {
              if (value.length < 1) {
                setState(() {
                  done = false;
                });
              }
              searchString = value;
            },
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
                    create: (_) => SearchBloc(
                        httpClient: http.Client(), album: searchString)
                      ..add(SearchDone()),
                    child: BlocBuilder<SearchBloc, SearchState>(
                      builder: (context, state) {
                        switch (state.status) {
                          case SearchStatus.failure:
                            return const Center(
                              child: Text('Failed to fetch data'),
                            );
                          case SearchStatus.success:
                            if (state.data.toString().length < 1) {
                              return const Center(child: Text('No data'));
                            }
                            break;
                          default:
                            return Center(child: const Text('Loading...'));
                        }
                        var _data = state.data.results!.albummatches!.album!;
                        return ListView.builder(
                          itemCount: _data.length,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AlbumDetailsScreen(
                                  artist: _data[index].artist,
                                  album: _data[index].name,
                                ),
                              ),
                            ).then(
                              (value) => setState(() {
                                done = false;
                                searchString = '';
                              }),
                            ),
                            child: Container(
                              constraints:
                                  BoxConstraints(maxHeight: double.infinity),
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              margin: EdgeInsets.only(bottom: 20),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.textGrey,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          '${_data[index].image![2].text}',
                                        ),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('${_data[index].artist}'),
                                        Text('${_data[index].name}'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
