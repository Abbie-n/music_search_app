import 'package:flutter/material.dart';
import 'package:music_search_app/utils/app/colors.dart';
import 'package:music_search_app/utils/size_config/extensions.dart';
import 'package:music_search_app/utils/size_config/config.dart';

class CustomTextField extends StatelessWidget {
  final config = SizeConfig();
  final prefixIcon;
  final suffixIcon;
  final validator;
  final onSaved;
  final hintText;
  final keyboardType;
  final inputFormatters;
  final textAlign;
  final onChanged;
  final controller;
  final readOnly;
  final obscureText;
  final obscuringCharacter;

  CustomTextField({
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onSaved,
    this.hintText,
    this.keyboardType,
    this.inputFormatters,
    this.textAlign,
    this.onChanged,
    this.controller,
    this.readOnly,
    this.obscureText = false,
    this.obscuringCharacter,
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
      readOnly: readOnly,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 1.8.height,
          horizontal: 5.width,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.darkTextGrey,
          fontWeight: FontWeight.w300,
          fontSize: 3.5.text,
          letterSpacing: 0.8,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: AppColors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(1.height),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(1.height),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(1.height),
        ),
      ),
      obscureText: obscureText,
      obscuringCharacter: '●',
      controller: controller,
      textAlign: textAlign,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      onSaved: onSaved,
      validator: validator,
      onChanged: onChanged,
    );
  }
}
