import 'package:flutter/material.dart';

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
