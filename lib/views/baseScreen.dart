import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:music_search_app/utils/app/colors.dart';
import 'package:music_search_app/utils/size_config/config.dart';
import 'package:music_search_app/utils/size_config/extensions.dart';

class BaseScreen extends StatelessWidget {
  final body;

  const BaseScreen({Key? key, this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 4.width,
              vertical: 2.height,
            ),
            child: body,
          ),
        ),
      ),
    );
  }
}
