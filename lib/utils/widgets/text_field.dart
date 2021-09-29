import 'package:flutter/material.dart';
import 'package:music_search_app/utils/app/colors.dart';

class CustomTextField extends StatelessWidget {
  final suffixIcon;
  final hintText;
  final onChanged;

  CustomTextField({
    this.suffixIcon,
    this.hintText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.primaryBlue.withOpacity(0.4),
      cursorWidth: 1,
      style: TextStyle(
        color: AppColors.primaryBlue.withOpacity(0.8),
        fontWeight: FontWeight.w500,
        fontSize: 14,
        letterSpacing: 0.8,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.darkTextGrey,
          fontWeight: FontWeight.w300,
          fontSize: 14,
          letterSpacing: 0.8,
        ),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: AppColors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.textGrey),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.textGrey),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.textGrey),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
