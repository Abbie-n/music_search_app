import 'package:flutter/material.dart';

Widget boldText(
  BuildContext context, {
  required String text,
  Color? color,
  double? fontSize,
}) {
  return Text(
    text,
    style: TextStyle(
      height: 1.3,
      fontWeight: FontWeight.w700,
      fontSize: fontSize,
      color: color,
    ),
  );
}

Widget regularText(
  BuildContext context, {
  required String text,
  Color? color,
  double? fontSize,
  final decoration,
  final fontWeight,
  final letterSpacing,
}) {
  return Text(
    text,
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      decoration: decoration,
      letterSpacing: letterSpacing,
    ),
  );
}

Widget regularBoldText(
  BuildContext context, {
  required String text,
  Color? color,
  double? fontSize,
  final fontWeight,
}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
  );
}
