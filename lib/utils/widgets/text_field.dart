import 'package:flutter/material.dart';
import 'package:music_search_app/utils/app/colors.dart';
import 'package:music_search_app/utils/size_config/extensions.dart';
import 'package:music_search_app/utils/size_config/config.dart';

class CustomTextField extends StatelessWidget {
  final config = SizeConfig();
  final suffixIcon;
  final hintText;
  String? text;
  final onChanged;

  CustomTextField({
    this.suffixIcon,
    this.hintText,
    this.text,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return TextFormField(
      cursorColor: AppColors.primaryBlue.withOpacity(0.4),
      cursorWidth: 0.2.width,
      style: TextStyle(
        color: AppColors.primaryBlue.withOpacity(0.8),
        fontWeight: FontWeight.w500,
        fontSize: 4.text,
        letterSpacing: 0.8,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 5.width,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.darkTextGrey,
          fontWeight: FontWeight.w300,
          fontSize: 3.5.text,
          letterSpacing: 0.8,
        ),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: AppColors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.textGrey),
          borderRadius: BorderRadius.circular(1.height),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.textGrey),
          borderRadius: BorderRadius.circular(1.height),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.textGrey),
          borderRadius: BorderRadius.circular(1.height),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
