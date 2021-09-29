import 'package:flutter/material.dart';
import 'package:music_search_app/utils/app/colors.dart';
import 'package:music_search_app/views/home_screen.dart';

Widget backButton(BuildContext context) {
  return GestureDetector(
    onTap: () => Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    ),
    child: Container(
      height: 50,
      width: 40,
      decoration: BoxDecoration(
        color: AppColors.containerColor,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: EdgeInsets.all(8),
      child: Center(child: Icon(Icons.arrow_back)),
    ),
  );
}
