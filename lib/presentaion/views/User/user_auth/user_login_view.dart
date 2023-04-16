import 'package:doctors_app/presentaion/bloc/auth/auth_cubit.dart';
import 'package:doctors_app/presentaion/bloc/auth/auth_states.dart';
import 'package:doctors_app/presentaion/const/app_message.dart';
import 'package:doctors_app/presentaion/resources/color_manager.dart';
import 'package:doctors_app/presentaion/views/Doctor/Home/home_view.dart';
import 'package:doctors_app/presentaion/views/Doctor/moderator/mod_login_view.dart';

import 'package:doctors_app/presentaion/views/User/user_auth/user_register_view.dart';
import 'package:doctors_app/presentaion/widgets/Custom_Text.dart';
import 'package:doctors_app/presentaion/widgets/Custom_button.dart';
import 'package:doctors_app/presentaion/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../Doctor/Home/dashboard.dart';
import '../../Doctor/doctor_reg/register_view.dart';
import '../Home/dash_board.dart';

class UserLoginView extends StatefulWidget {
  String cat;

  UserLoginView({required this.cat});

  @override
  State<UserLoginView> createState() => _UserLoginViewState();
}

class _UserLoginViewState extends State<UserLoginView> {
  int toogleIndex=0;
  Color toogleColor = ColorsManager.primary;
    Color toogleColorInActive = Colors.grey;

  @override
  Widget build(BuildContext context) {


    if (widget.cat == 'user') {
      return BlocProvider(
          create: (BuildContext context) => AuthCubit(),
          child:
              BlocConsumer<AuthCubit, AuthStates>(listener: (context, state) {
            if (state is UserLoginSuccessState) {
              Get.offAll(const DashBoardFragment());
              appMessage(text: 'تم تسجيل الدخول بنجاح');
            }

            if (state is UserLoginErrorState) {
              appMessage(text: 'خطا في تسجيل دخول');
            }

            if (state is UserLoginLoadingState) {
              print("LOADING");
            }
          }, builder: (context, state) {
            AuthCubit authCubit = AuthCubit.get(context);
            return Scaffold(
              backgroundColor: Colors.grey[100],
              appBar: AppBar(
                elevation: 0,
                backgroundColor: ColorsManager.primary,
                toolbarHeight: 1,
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            child: CircleAvatar(
                                radius: 100,
                                backgroundColor: ColorsManager.primary,
                                child: Image.asset(
                                  'assets/images/logo.png',
                                  fit: BoxFit.scaleDown,
                                )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Custom_Text(
                            text: ' قم تسجيل دخول ',
                            fontSize: 24,
                            alignment: Alignment.center,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: Container(
                              child:Row(
                                mainAxisAlignment:MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    child:Container(
                                      width: 120,
                                      height: 60,
                                      child: Card(
                                        color:toogleColor,
                                        child:Custom_Text(text: 'بالبريد',color:Colors.white,
                                            alignment:Alignment.center
                                            ,fontSize: 22),
                                      ),
                                    ),
                                    onTap:(){
                                      setState(() {
                                        toogleColor=ColorsManager.primary;
                                        toogleColorInActive=Colors.grey;
                                        toogleIndex=0;
                                      });
                                    },
                                  ),
                                  InkWell(
                                    child:Container(
                                      width: 120,
                                      height: 60,
                                      child: Card(
                                        color:toogleColorInActive,
                                        child:Custom_Text(text: 'بالهاتف',color:Colors.white,
                                            alignment:Alignment.center
                                            ,fontSize: 22),
                                      ),
                                    ),
                                    onTap:(){
                                      setState(() {
                                        toogleColor=Colors.grey;
                                        toogleColorInActive=ColorsManager.primary;
                                        toogleIndex=1;
                                      });
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          (toogleIndex==0)?
                          CustomTextFormField(
                            controller: authCubit.emailController,
                            color: Colors.black,
                            hint: "البريد الالكتروني ",
                            max: 2,
                            obs: false,
                            obx: false,
                            ontap: () {},
                            type: TextInputType.text,
                          ): CustomTextFormField(
                            controller: authCubit.phoneController,
                            color: Colors.black,
                            hint: "رقم الهاتف ",
                            max: 2,
                            obs: false,
                            obx: false,
                            ontap: () {},
                            type: TextInputType.text,
                          ),
                          const SizedBox(
                            height: 30,
                          ),

                          CustomTextFormField(
                            controller: authCubit.passwordController,
                            color: Colors.black,
                            hint: "كلمة المرور ",
                            obs: true,
                            obx: true,
                            ontap: () {},
                            type: TextInputType.text,
                          ),

                          const SizedBox(
                            height: 40,
                          ),
                          CustomButton(
                              text: "تسجيل الدخول ",
                              onPressed: () {

                                if(toogleIndex==0){
                                  authCubit.userLogin();
                                }else{
                                  authCubit.userLoginWithPhone();
                                }

                              },
                              color1: ColorsManager.primary,
                              color2: Colors.white),
                          const SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Custom_Text(
                                    text: 'ليس لديك حساب ؟ ',
                                    fontSize: 17,
                                    color: Colors.grey),
                                SizedBox(
                                  width: 10,
                                ),
                                Custom_Text(
                                    text: 'انشاء حساب  ',
                                    fontSize: 15,
                                    color: ColorsManager.primary),
                              ],
                            ),
                            onTap: () {
                              Get.to(UserRegisterView(
                                cat: 'user',
                              ));
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }));
    } else {
      return BlocProvider(
          create: (BuildContext context) => AuthCubit(),
          child:
              BlocConsumer<AuthCubit, AuthStates>(listener: (context, state) {
            if (state is LoginSuccessState) {
              Get.offAll(DashBoardDoctorView(
                type: 'doctor',
              ));

              appMessage(text: 'تم تسجيل الدخول بنجاح');
            }

            if (state is LoginErrorState) {
              appMessage(text: 'خطا في تسجيل دخول');
            }

            if (state is LoginSuccessState) {
              Get.offAll(DashBoardDoctorView(
                type: 'doctor',
              ));

              appMessage(text: 'تم تسجيل الدخول بنجاح');
            }

            if (state is LoginErrorState) {
              appMessage(text: 'خطا في تسجيل دخول');
            }
            if (state is LoginLoadingState) {
              print("LOADING");
            }
          }, builder: (context, state) {
            AuthCubit authCubit = AuthCubit.get(context);
            return Scaffold(
              backgroundColor: Colors.grey[100],
              appBar: AppBar(
                elevation: 0,
                backgroundColor: ColorsManager.primary,
                toolbarHeight: 1,
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(

                            child: CircleAvatar(
                                radius: 100,
                                backgroundColor: ColorsManager.primary,
                                child: Image.asset(
                                  'assets/images/logo.png',
                                  fit: BoxFit.scaleDown,
                                )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Custom_Text(
                            text: ' قم تسجيل دخول ',
                            fontSize: 24,
                            alignment: Alignment.center,
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Container(
                              child:Row(
                                mainAxisAlignment:MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    child:Container(
                                      width: 120,
                                      height: 60,
                                      child: Card(
                                        color:toogleColor,
                                        child:Custom_Text(text: 'بالبريد',color:Colors.white,
                                            alignment:Alignment.center
                                            ,fontSize: 22),
                                      ),
                                    ),
                                    onTap:(){
                                      setState(() {
                                        toogleColor=ColorsManager.primary;
                                        toogleColorInActive=Colors.grey;
                                        toogleIndex=0;
                                      });
                                    },
                                  ),
                                  InkWell(
                                    child:Container(
                                      width: 120,
                                      height: 60,
                                      child: Card(
                                        color:toogleColorInActive,
                                        child:Custom_Text(text: 'بالهاتف',color:Colors.white,
                                            alignment:Alignment.center
                                            ,fontSize: 22),
                                      ),
                                    ),
                                    onTap:(){
                                      setState(() {
                                        toogleColor=Colors.grey;
                                        toogleColorInActive=ColorsManager.primary;
                                        toogleIndex=1;
                                      });
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 50,
                          ),
                          (toogleIndex == 0)
                              ? CustomTextFormField(
                                  controller: authCubit.emailController,
                                  color: Colors.black,
                                  hint: "البريد الالكتروني ",
                                  max: 2,
                                  obs: false,
                                  obx: false,
                                  ontap: () {},
                                  type: TextInputType.text,
                                )
                              : CustomTextFormField(
                                  controller: authCubit.phoneController,
                                  color: Colors.black,
                                  hint: " رقم الهاتف ",
                                  max: 2,
                                  obs: false,
                                  obx: false,
                                  ontap: () {},
                                  type: TextInputType.text,
                                ),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomTextFormField(
                            controller: authCubit.passwordController,
                            color: Colors.black,
                            hint: "كلمة المرور ",
                            obs: true,
                            obx: true,
                            ontap: () {},
                            type: TextInputType.text,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          CustomButton(
                              text: "تسجيل الدخول ",
                              onPressed: () {
                                if(toogleIndex==0){
                                  authCubit.login();
                                }else{
                                  authCubit.loginDoctorWithPhone();
                                }},
                              color1: ColorsManager.primary,
                              color2: Colors.white),
                          const SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Custom_Text(
                                    text: 'ليس لديك حساب ؟ ',
                                    fontSize: 17,
                                    color: Colors.grey),
                                SizedBox(
                                  width: 10,
                                ),
                                Custom_Text(
                                    text: 'انشاء حساب  ',
                                    fontSize: 15,
                                    color: ColorsManager.primary),
                              ],
                            ),
                            onTap: () {
                              Get.to(RegisterView(
                                sales: false,
                              ));
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Custom_Text(
                                    text: 'انت احد مديري حساب لطبيب ',
                                    fontSize: 17,
                                    color: Colors.grey),
                                SizedBox(
                                  width: 10,
                                ),
                                Custom_Text(
                                    text: 'تسجيل كمدير حساب  ',
                                    fontSize: 15,
                                    color: ColorsManager.primary),
                              ],
                            ),
                            onTap: () {
                              Get.to(ModLoginView());
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }));
    }
  }
}
