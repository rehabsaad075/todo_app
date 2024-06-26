import 'package:flutter/material.dart';
import 'package:todo_app/view_model/utils/material/app_colors.dart';

class TextFormFieldCustom extends StatelessWidget {
  final void Function()? onTap;
  final TextEditingController? controller;
  final String labelText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final IconData ?icon;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final bool obscureText ;
  final bool ?readOnly;
  final void Function()? onSuffixPressed;
  const TextFormFieldCustom({
    Key? key,
    this.onTap,
    this.controller,
    required this.labelText,
    this.keyboardType,
    this.textInputAction=TextInputAction.next,
    this.icon,
    this.validator,
    this.autovalidateMode,
    this.obscureText=false,
     this.readOnly,
    this.onSuffixPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.appColor,
      controller: controller,
      validator: validator,
      obscureText:obscureText ,
      autovalidateMode: autovalidateMode,
      readOnly: readOnly??false,
      style: const TextStyle(
          color: AppColors.appColor
      ),
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide:
            const BorderSide(
                color: AppColors.appColor
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide:
            const BorderSide(
                color: AppColors.errorColor
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide:
            const BorderSide(
              color: Colors.grey,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide:
            const BorderSide(
                color: AppColors.appColor
            )),
        suffixIcon:IconButton(
          onPressed: onSuffixPressed,
          icon: Icon(
              icon,
            color: AppColors.gray,
          )
          ,),
        labelText:labelText,
        labelStyle: const TextStyle(
            color: AppColors.appColor
        ),
      ),
      onTap: onTap,
    );
  }
}
