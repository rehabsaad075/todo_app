import 'package:flutter/material.dart';
import 'package:todo_app/view_model/utils/material/app_colors.dart';

class NoTasksBody extends StatelessWidget {
  const NoTasksBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            width: 250,
            child: Image(
              image: AssetImage(
                'assets/images/nothing_do.png',
              ),
            ),
          ),
          SizedBox(height: 20,),
          Text(
            'لا توجد مهام فى قائمتك ,قم بلإضافة',
            style: TextStyle(
                color: AppColors.appColor,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
