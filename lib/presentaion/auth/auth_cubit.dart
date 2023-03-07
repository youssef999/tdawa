
import 'dart:convert';

import 'package:doctors_app/Data/api_connection/api_connection.dart';
import 'package:doctors_app/domain/models/user.dart';
import 'package:doctors_app/presentaion/auth/auth_states.dart';
import 'package:doctors_app/presentaion/resources/color_manager.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';


class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() :super(AppIntialState());

  // objects mn nfsy
  static AuthCubit get(context) => BlocProvider.of(context);
  TextEditingController nameController = TextEditingController();
  TextEditingController catController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController infoController = TextEditingController();
  TextEditingController masterController = TextEditingController();
  TextEditingController degreeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordCheck = TextEditingController();
  userModel user = userModel();


  // void validateUserEmail() async {
  //   try {
  //     var res = await http.post(Uri.parse(API.validateEmail),
  //         body: {'user_email': emailController.text.trim()});
  //
  //     print("res==${res.body}");
  //
  //     if (res.statusCode == 200) {
  //       var resBodyofValidateEmail = jsonDecode((res.body));
  //       if (resBodyofValidateEmail['emailFound']) {
  //         Get.snackbar('', 'Done', backgroundColor: ColorsManager.primary2,
  //             colorText: Colors.white);
  //       } else {
  //         print("here");
  //         registerAndSaveUserRecord();
  //       }
  //     }
  //   } catch (e) {
  //     print("ERRORxxx::$e");
  //     Get.snackbar('', 'Error', backgroundColor: ColorsManager.primary2,
  //         colorText: Colors.white);
  //   }
  // }

  registerAndSaveUserRecord() async {
    try {
      emit(RegisterLoadingState());
      var res =
      await http.post(Uri.parse(API.signup), body:
      {
        "doctor_email":emailController.text.trim(),
        "doctor_password":passwordController.text.trim(),
        "doctor_name":nameController.text.trim(),
        "doctor_cat":catController.text.trim(),
        "doctor_info":infoController.text.trim(),
        "doctor_masters":masterController.text.trim(),
        "doctor_degree":degreeController.text.trim(),
        "doctor_phone":phoneController.text.trim(),
      }
      );

      if (res.statusCode == 200) {
        emit(RegisterSuccessState());
        var resOfSignUp = jsonDecode(res.body);

        print(resOfSignUp);
        if (resOfSignUp['Success'] == true) {
          Get.snackbar(
              '', " Sign up DONE ", backgroundColor: ColorsManager.primary2,
              colorText: Colors.white);

          //  Get.off(DashBoardFragment());


        } else {
          print("error${res.statusCode}");
          emit(RegisterErrorState('not 200'));
          Get.snackbar('', "ERROR :: TRY AGAIN ",
              backgroundColor: ColorsManager.primary2, colorText: Colors.white);
        }
      }
    } catch (e) {
      
      emit(RegisterErrorState(e.toString()));
      print("error$e");
      Get.snackbar(
          '', "ERROR :: TRY AGAIN ", backgroundColor: ColorsManager.primary2,
          colorText: Colors.white);
    }
  }

  login() async {

    emit(LoginLoadingState());
    try {

      var res = await http.post(Uri.parse(API.login), body: {

        'doctor_email': emailController.text.trim(),
        'doctor_password': passwordController.text.trim(),
      });

      print("res${res.body}");

      if (res.statusCode == 200) {
        print("200");
        emit(LoginSuccessState());

        var resOfLogin = jsonDecode((res.body));

        if (resOfLogin['success'] == true) {
          userModel userInfo = userModel.fromJson(resOfLogin['userData']);
          print("UserINfo====${userInfo.user_email}");

          final box = GetStorage();
          box.write('email', userInfo.user_email);
          box.write('userName', userInfo.user_name);
          box.write('userId', userInfo.user_id);


          print("SUCCESSS");
          Get.snackbar(
              '', 'Login DONE ', backgroundColor: ColorsManager.primary2,
              colorText: Colors.white);
          //      Get.off(DashBoardFragment());

        }

        else {
          emit(LoginErrorState('not 200'));
          Get.snackbar('', 'ERROR :: TRY AGAIN ',
              backgroundColor: ColorsManager.primary2, colorText: Colors.white);
        }
      }
      else{
        print(res.statusCode);
      }
    } catch (e) {
      print(e);
      emit(LoginErrorState(e.toString()));

      Get.snackbar(
          '', 'ERROR :: TRY AGAIN ', backgroundColor: ColorsManager.primary2,
          colorText: Colors.white);
    }
  }


}













