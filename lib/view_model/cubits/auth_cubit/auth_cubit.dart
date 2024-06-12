import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/view_model/data/local/shared_keys.dart';
import 'package:todo_app/view_model/data/local/shared_preferences.dart';
import 'package:todo_app/view_model/data/network/diohelper.dart';
import 'package:todo_app/view_model/data/network/endPoints.dart';
import 'package:todo_app/view_model/utils/functions/show_toast_function.dart';
import 'package:todo_app/view_model/utils/material/app_colors.dart';
import 'package:todo_app/view_model/utils/material/app_icons.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());
  static AuthCubit get(context)=>BlocProvider.of<AuthCubit>(context);

  var formKey=GlobalKey<FormState>();
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController passwordConfirmationController=TextEditingController();

  Future<void>register()async {
    emit(RegisterLoadingState());
    await DioHelper.post(
        endPoint: EndPoints.register,
      body: {
        'name':nameController.text,
        'email':emailController.text,
        'password':passwordController.text,
        'password_confirmation':passwordConfirmationController.text
      }
    ).then((value) {
      showToast(msg: 'تم إنشاء حساب جديد بنجاح');
      emit(RegisterSuccessState());
    }).catchError((error){
      showToast(msg: error.toString(),color: AppColors.errorColor);
      emit(RegisterErrorState());
      throw error;
    });
  }

  Future<void>login()async {
    emit(LoginLoadingState());
    await DioHelper.post(
        endPoint: EndPoints.login,
      body: {
        'email':emailController.text,
        'password':passwordController.text,
      }
    ).then((value) {
      LocalData.set(key:SharedKeys.token,value:value.data['data']['token']);
      showToast(msg: 'تم تسجيل الدخول بنجاح');
      emit(LoginSuccessState());
    }).catchError((error){
      showToast(msg: error.toString(),color: AppColors.errorColor);
      emit(LoginErrorState());
      throw error;
    });

  }

  bool isPassword=true;
  IconData suffixIcon=AppIcons.visibilityIcon;
  void changeSuffixIconPass(){
    isPassword?suffixIcon=AppIcons.visibilityOffIcon:suffixIcon=AppIcons.visibilityIcon;
    isPassword=!isPassword;
    emit(ChangeSuffixIconPass());
  }

  bool isPasswordConf=true;
  IconData suffixIconConf=AppIcons.visibilityIcon;
  void changeSuffixIconPassConf(){
    isPasswordConf?suffixIconConf=AppIcons.visibilityOffIcon:suffixIconConf=AppIcons.visibilityIcon;
    isPasswordConf=!isPasswordConf;
    emit(ChangeSuffixIconPass());
  }
}
