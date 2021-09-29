import 'package:flutter/material.dart';
import 'package:music_search_app/utils/app/colors.dart';
import 'package:music_search_app/utils/size_config/config.dart';
import 'package:music_search_app/utils/size_config/extensions.dart';

final config = SizeConfig();
Widget backButton(BuildContext context) {
  SizeConfig.init(context);
  return GestureDetector(
    onTap: () => Navigator.pop(context),
    child: Container(
      height: 3.5.height,
      width: 8.width,
      decoration: BoxDecoration(
        color: AppColors.containerColor,
        borderRadius: BorderRadius.circular(40),
      ),
      padding: EdgeInsets.all(8),
      child: Icon(Icons.arrow_back),
    ),
  );
}
