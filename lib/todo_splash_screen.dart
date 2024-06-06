import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/todo_home_page_screen.dart';

class TodoSplashScreen extends StatelessWidget {
  const TodoSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  AnimatedSplashScreen(
        duration: 3000,
        splash: 'assets/images/todo_splash_image.jpg',
        nextScreen: const TodoHomePageScreen(),
        splashIconSize: 300.0,
        splashTransition: SplashTransition.fadeTransition,
    );
  }
}
