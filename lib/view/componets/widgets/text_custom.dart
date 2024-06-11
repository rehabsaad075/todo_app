import 'package:flutter/material.dart';
import 'package:todo_app/view_model/app_colors.dart';

class TextCustom extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  const TextCustom({super.key,
    required this.text,
    this.color=AppColors.appColor,
    this.fontSize=20,
    this.fontWeight,

  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight
      ),
    );
  }
}
