import 'package:flutter/material.dart';
import 'package:todo_app/view_model/app_colors.dart';

Future<DateTime?>showDatePickerFunction(
{
  required BuildContext context,
}
    ) async {
 return showDatePicker(
     context: context,
     initialDate: DateTime.now(),
     firstDate: DateTime.now(),
     lastDate: DateTime.now().add(const Duration(days: 365*5)),
   builder: (context,child){
     return Theme(
         data: Theme.of(context).copyWith(
             colorScheme: const ColorScheme.light(
                 primary: AppColors.appColor,
                 onPrimary: AppColors.whiteColor,
                 onSurface: AppColors.appColor
             ),
             textButtonTheme: TextButtonThemeData(
                 style: TextButton.styleFrom(
                     foregroundColor: AppColors.appColor
                 )
             )
         ),
         child: child!
     );
   },
 );

}