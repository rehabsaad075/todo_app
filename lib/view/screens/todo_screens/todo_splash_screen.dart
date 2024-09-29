import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/view/screens/auth_screens/login_screen.dart';
import 'package:todo_app/view/screens/todo_screens/show_statistic_screen.dart';
import 'package:todo_app/view_model/data/local/shared_keys.dart';
import 'package:todo_app/view_model/data/local/shared_preferences.dart';

class TodoSplashScreen extends StatelessWidget {
  const TodoSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  AnimatedSplashScreen(
        duration: 3000,
        splash: 'assets/images/todo_splash_image.jpg',
        nextScreen:LocalData.get(key:SharedKeys.token)!=null?const ShowStatisticScreen():const LoginScreen(),
        splashIconSize: 300.0,
        splashTransition: SplashTransition.fadeTransition,
    );
  }
}
