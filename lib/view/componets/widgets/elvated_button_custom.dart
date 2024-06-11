import 'package:flutter/material.dart';
import 'package:todo_app/view_model/utils/material/app_colors.dart';

class ElevatedButtonCustom extends StatelessWidget {
  final void Function()? onPressed;
  final Widget child;
  const ElevatedButtonCustom({super.key,required this.onPressed, required this.child,});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor:AppColors.appColor ,
          minimumSize:  const Size(double.infinity,50),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          )
      ),
      child:child,
    );
  }
}
