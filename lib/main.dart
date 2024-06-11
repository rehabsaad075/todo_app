import 'package:flutter/material.dart';
import 'package:todo_app/view/screens/todo_screens/todo_splash_screen.dart';
import 'package:todo_app/view_model/data/local/shared_preferences.dart';
import 'package:todo_app/view_model/data/network/diohelper.dart';
import 'package:todo_app/view_model/utils/material/app_colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalData.init();
  await DioHelper.init();
  runApp(const TodoApp());
}
class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TodoSplashScreen(),
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.whiteColor,
              titleTextStyle: TextStyle(
                  color: AppColors.appColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w600
              ),
              titleSpacing: 0,
              iconTheme: IconThemeData(
                color: AppColors.appColor,
                size: 27,
              ),
              actionsIconTheme: IconThemeData(
                  color: AppColors.appColor,
                  size: 25
              ),
              elevation: 0
          ),
          scaffoldBackgroundColor: AppColors.whiteColor,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
              ),
              backgroundColor: AppColors.appColor
          )
      ),
    );
  }
}

