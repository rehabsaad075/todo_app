import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/view/componets/widgets/circular_progress_loading_custom.dart';
import 'package:todo_app/view/componets/widgets/elvated_button_custom.dart';
import 'package:todo_app/view/componets/widgets/text_form_field_custom.dart';
import 'package:todo_app/view/componets/widgets/text_custom.dart';
import 'package:todo_app/view/screens/todo_screens/todo_home_page_screen.dart';
import 'package:todo_app/view_model/cubits/auth_cubit/auth_cubit.dart';
import 'package:todo_app/view_model/utils/functions/navigation_functions.dart';
import 'package:todo_app/view_model/utils/material/app_colors.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          AuthCubit authCubit = AuthCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: Form(
                key: authCubit.formKey,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(top: 150, right: 18, left: 18),
                  children: [
                    TextCustom(
                      text: 'todo_app',
                      fontSize: 25,
                      color: AppColors.appColor.withOpacity(0.6),
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const TextCustom(
                      text: 'إنشاء حساب',
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormFieldCustom(
                      labelText: 'اسم المستخدم',
                      keyboardType: TextInputType.text,
                      controller: authCubit.nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'اسم المستخدم مطلوب';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormFieldCustom(
                      labelText: 'البريد الالكترنى',
                      keyboardType: TextInputType.emailAddress,
                      controller: authCubit.emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'البريد الالكترونى مطلوب';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormFieldCustom(
                      labelText: ' كلمة المرور',
                      keyboardType: TextInputType.text,
                      controller: authCubit.passwordController,
                      obscureText: authCubit.isPassword,
                      icon: authCubit.suffixIcon,
                      onTap: (){
                        authCubit.changeSuffixIconPass();
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'كلمة المرور مطلوبة';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormFieldCustom(
                      labelText: ' تاكيد كلمة المرور',
                      keyboardType: TextInputType.text,
                      controller: authCubit.passwordConfirmationController,
                      obscureText: authCubit.isPassword,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textInputAction: TextInputAction.done,
                      icon: authCubit.suffixIcon,
                      onTap: (){
                        authCubit.changeSuffixIconPass();
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'كلمة المرور مطلوبة';
                        }
                        else if(value !=authCubit.passwordController.text){
                          return 'كلمة المرور غير صحيحة';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButtonCustom(
                      onPressed: () {
                        if (authCubit.formKey.currentState!.validate()) {
                          AuthCubit.get(context).register().then((value) {
                            navigationPushFunction(
                                context: context,
                                screen: const TodoHomePageScreen());
                          });
                        }
                      },
                      child: Visibility(
                        visible: state is RegisterLoadingState,
                        replacement: const TextCustom(
                          text: 'إنشاء حساب',
                          color: AppColors.whiteColor,
                          fontSize: 18,
                        ),
                        child: const CircularProgressLoadingCustom(),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextCustom(
                          text: 'عندك حساب ؟',
                          color: AppColors.gray800,
                          fontSize: 18,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: TextButton.styleFrom(
                              splashFactory: NoSplash.splashFactory,
                            ),
                            child: const TextCustom(
                              text: 'تسجيل دخول',
                              fontSize: 18,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
