import 'package:flutter/material.dart';
import 'package:todo_app/view/componets/widgets/elvated_button_custom.dart';
import 'package:todo_app/view/componets/widgets/text_form_field_custom.dart';
import 'package:todo_app/view/componets/widgets/text_custom.dart';
import 'package:todo_app/view/screens/auth_screens/register_screen.dart';
import 'package:todo_app/view_model/utils/material/app_colors.dart';
import 'package:todo_app/view_model/utils/material/app_icons.dart';
import 'package:todo_app/view_model/utils/functions/navigation_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Form(
          key: GlobalKey<FormState>(),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(
              top: 150,
              right: 18,
              left: 18
            ),
            children:  [
              const Opacity(
                opacity: 0.6,
                child: TextCustom(
                  text: 'todo_app',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20,),
              const TextCustom(
                text: 'تسجيل دخول',
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 15,),
              const Opacity(
                opacity: 0.8,
                child: TextCustom(
                  text: 'يرجى تسجيل الدخول لاستكمال الخطوات',
                ),
              ),
              const SizedBox(height: 40,),
              TextFormFieldCustom(
                labelText: 'البريد الالكترنى',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'البريد الالكترونى مطلوب';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10,),
              TextFormFieldCustom(
                labelText: ' كلمة المرور',
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                icon: AppIcons.visibilityIcon,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'كلمة المرور مطلوبة';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30,),
              ElevatedButtonCustom(
                onPressed: () {

                },
                child: const TextCustom(
                  text: 'تسجيل الدخول',
                  color: AppColors.whiteColor,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 15,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   TextCustom(
                      text: 'ليس لديك حساب ؟',
                    color: AppColors.gray800,
                    fontSize: 18,
                  ),
                  TextButton(
                      onPressed: (){
                        navigationPushFunction(
                            context: context,
                            screen: const RegisterScreen()
                        );
                      },
                      style: TextButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                      ),
                      child: const TextCustom(
                        text: 'انشاء حساب',
                        fontSize: 18,
                      )
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
