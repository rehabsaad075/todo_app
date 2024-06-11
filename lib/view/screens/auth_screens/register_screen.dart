import 'package:flutter/material.dart';
import 'package:todo_app/view/componets/elvated_button_custom.dart';
import 'package:todo_app/view/componets/text_form_field_custom.dart';
import 'package:todo_app/view/componets/widgets/text_custom.dart';
import 'package:todo_app/view_model/app_colors.dart';
import 'package:todo_app/view_model/app_icons.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
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
              const SizedBox(height: 15,),
              const TextCustom(
                text: 'إنشاء حساب',
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 30,),
              TextFormFieldCustom(
                labelText: 'اسم المستخدم',
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'اسم المستخدم مطلوب';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10,),
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
                icon: AppIcons.visibilityIcon,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'كلمة المرور مطلوبة';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10,),
              TextFormFieldCustom(
                labelText: ' تاكيد كلمة المرور',
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
                  text: 'إنشاء حساب',
                  color: AppColors.whiteColor,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextCustom(
                    text: 'عندك حساب ؟',
                    color: AppColors.gray800,
                    fontSize: 18,
                  ),
                  TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                      ),
                      child: const TextCustom(
                        text: 'تسجيل دخول',
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
