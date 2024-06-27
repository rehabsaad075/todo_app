import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:todo_app/view/componets/widgets/circular_progress_loading_custom.dart';
import 'package:todo_app/view/componets/widgets/elvated_button_custom.dart';
import 'package:todo_app/view/screens/todo_screens/todo_home_page_screen.dart';
import 'package:todo_app/view_model/utils/material/app_colors.dart';

class ShowStatisticScreen extends StatelessWidget {
  const ShowStatisticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          //child:TodoCubit.get(context).statisticsModel!=null?
         child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Dashboard Tasks',
                style: TextStyle(
                    color: AppColors.appColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                ),
              ),
              Container(
                padding: const EdgeInsets.all(50),
                child: CircularPercentIndicator(
                    radius: 140.0,
                    lineWidth: 10.0,
                    backgroundColor: AppColors.gray800!,
                    progressColor:AppColors.appColor,
                    // percent: (cubit.statisticsModel?.data?.newTask??0.1).toDouble()/cubit.total.toDouble(),
                    animation: true,
                    center: CircularPercentIndicator(
                      radius: 120.0,
                      lineWidth: 10.0,
                      backgroundColor: AppColors.gray800!,
                      progressColor: AppColors.purple,
                     // percent: (cubit.statisticsModel?.data?.completed??0.1).toDouble()/cubit.total.toDouble(),
                      animation: true,
                      center: CircularPercentIndicator(
                        radius: 100.0,
                        lineWidth: 10.0,
                        backgroundColor: AppColors.gray800!,
                        progressColor: AppColors.teal,
                        //percent: (cubit.statisticsModel?.data?.doing??0.1).toDouble()/cubit.total.toDouble(),
                        animation: true,
                        center: CircularPercentIndicator(
                          radius: 80.0,
                          lineWidth: 10.0,
                          backgroundColor: AppColors.gray800!,
                          progressColor: AppColors.errorColor,
                          //percent: (cubit.statisticsModel?.data?.outdated??0.1).toDouble()/cubit.total.toDouble(),
                          animation: true,
                          center: const Text(
                            'Tasks',
                            //"${cubit.total.toString()??''} Tasks",
                            style: TextStyle(
                              color:AppColors.appColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    )),
              ),
              Row(
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color:AppColors.appColor,
                    ),
                  ),
                  const SizedBox(width: 5,),
                  const Text(
                    'New Tasks',
                    style: TextStyle(
                      color: AppColors.appColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color:  AppColors.purple,
                    ),
                  ),
                  const SizedBox(width: 5,),
                  const Text(
                    'Completed Tasks',
                    style: TextStyle(
                      color: AppColors.purple,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color:  AppColors.teal,
                    ),
                  ),
                  const SizedBox(width: 5,),
                  const Text(
                    'doing Tasks',
                    style: TextStyle(
                      color: AppColors.teal,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.errorColor,
                    ),
                  ),
                  const SizedBox(width: 5,),
                  const Text(
                    'Outdated Tasks',
                    style: TextStyle(
                      color: AppColors.errorColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40,),
              ElevatedButtonCustom(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const TodoHomePageScreen()
                      )
                  );
                },

                child: const Text('Go To Tasks'),
              )
            ],
          )
          //const Center(child: CircularProgressLoadingCustom()),
        ),
      ),
    );
  }
}
