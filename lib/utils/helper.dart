import 'dart:async';
import 'package:flutter/material.dart';
import 'package:music_search_app/utils/app/colors.dart';
import 'package:music_search_app/utils/widgets/circular_loading_widget.dart';

class Helper {
  static String phoneNumber(String input) {
    String number = '+234${phoneNumberFormater(input)}';
    return number;
  }

  static String phoneNumberFormater(String input) {
    var number;
    if (input.length == 11) {
      number = input.substring(1, 11);
    } else {
      number = input;
    }
    return number;
  }

  static OverlayEntry overlayLoader(context) {
    OverlayEntry loader = OverlayEntry(builder: (context) {
      final size = MediaQuery.of(context).size;
      return Positioned(
        height: size.height,
        width: size.width,
        top: 0,
        left: 0,
        child: Material(
          color: AppColors.white.withOpacity(0.7),
          child: CircularLoadingWidget(height: 200),
        ),
      );
    });
    return loader;
  }

  static hideLoader(OverlayEntry loader) {
    Timer(Duration(milliseconds: 500), () {
      try {
        loader.remove();
      } catch (e) {}
    });
  }

  static String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning,';
    }
    if (hour < 17) {
      return 'Good Afternoon,';
    }
    return 'Good Evening,';
  }

  static String formatPhoneNumber(String number) {
    final result = number.replaceAllMapped(
        RegExp(r".{4}"), (match) => "${match.group(0)}-");
    return result;
  }
}
