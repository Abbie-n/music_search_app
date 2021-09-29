import 'package:flutter/material.dart';
import 'package:music_search_app/utils/app/colors.dart';
import 'package:music_search_app/utils/helper.dart';
import 'package:music_search_app/utils/size_config/config.dart';
import 'package:music_search_app/utils/size_config/extensions.dart';
import 'package:music_search_app/utils/widgets/text_widget.dart';
import 'package:music_search_app/views/baseScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final formKey = GlobalKey<FormState>();

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BaseScreen(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          regularText(
            context,
            text: Helper.greeting(),
            color: AppColors.primaryBlue,
            fontSize: 7.text,
            fontWeight: FontWeight.w600,
          ),
          regularText(
            context,
            text: 'Abbie',
            color: AppColors.primaryBlue,
            letterSpacing: 0.8,
            fontSize: 4.5.text,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            height: 2.height,
          ),
          regularText(
            context,
            text: 'Top Albums',
            color: AppColors.textGrey,
            letterSpacing: 0.8,
            fontSize: 4.text,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(
            height: 2.height,
          ),
          // Container(
          //   height: 58.height,
          //   width: double.infinity,
          //   child: ListView.builder(
          //     itemCount: 5,
          //     itemBuilder: (context, index) => NotesComponent(
          //       title: title,
          //       description: desc,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
