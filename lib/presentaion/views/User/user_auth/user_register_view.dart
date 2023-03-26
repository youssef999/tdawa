
import 'package:doctors_app/presentaion/bloc/auth/auth_cubit.dart';
import 'package:doctors_app/presentaion/bloc/auth/auth_states.dart';
import 'package:doctors_app/presentaion/const/app_message.dart';
import 'package:doctors_app/presentaion/resources/color_manager.dart';
import 'package:doctors_app/presentaion/views/User/user_auth/user_login_view.dart';
import 'package:doctors_app/presentaion/widgets/Custom_Text.dart';
import 'package:doctors_app/presentaion/widgets/Custom_button.dart';
import 'package:doctors_app/presentaion/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';



 class UserRegisterView extends StatelessWidget {
 String cat;


 UserRegisterView({required this.cat});

  @override
  Widget build(BuildContext context) {
    if (cat == 'user') {
      return BlocProvider(
          create: (BuildContext context) => AuthCubit(),
          child: BlocConsumer<AuthCubit, AuthStates>(
              listener: (context, state) {
                if (state is UserRegisterSuccessState) {
                  Get.offAll(UserLoginView(
                    cat: 'user',
                  ));
                  appMessage(text: 'تم انشاء الحساب بنجاح');

                }

                if (state is UserRegisterErrorState) {
                  appMessage(text: 'خطا في انشاء الحساب');

                }
              },
              builder: (context, state) {
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
                              const SizedBox(height: 20,),

                              const SizedBox(height: 10,),
                              const Custom_Text(text: 'انشاء حساب جديد',
                                fontSize: 24,
                                alignment: Alignment.center,
                                color: Colors.black,
                              ),
                              const SizedBox(height: 20,),

                              const Custom_Text(text:

                              'ادخل البيانات التالية حتى تتمكن من انشاء الحساب والوصول الى اقرب طبيب اليك',
                                fontSize: 17,
                                alignment: Alignment.center,
                                color: Colors.black54,
                              ),


                              const SizedBox(height: 40,),


                              CustomTextFormField(
                                controller: authCubit.nameController,
                                color: Colors.black,
                                hint: "الاسم بالكامل",
                                max: 2,
                                obs: false,
                                obx: false,
                                ontap: () {},
                                type: TextInputType.text,
                              ),
                              const SizedBox(height: 10,),
                              CustomTextFormField(
                                controller: authCubit.emailController,
                                color: Colors.black,
                                hint: "البريد الالكتروني ",
                                max: 2,
                                obs: false,
                                obx: false,
                                ontap: () {},
                                type: TextInputType.text,
                              ),
                              const SizedBox(height: 10,),
                              CustomTextFormField(
                                controller: authCubit.phoneController,
                                color: Colors.black,
                                hint: "رقم الهاتف  ",
                                max: 2,
                                obs: false,
                                obx: false,
                                ontap: () {},
                                type: TextInputType.phone,
                              ),


                              const SizedBox(height: 20,),
                              CustomTextFormField(
                                controller: authCubit.passwordController,
                                color: Colors.black,
                                hint: "كلمة المرور ",
                                obs: true,
                                obx: true,
                                ontap: () {},
                                type: TextInputType.text,
                              ),
                              const SizedBox(height: 30,),

                              CustomButton(text: "انشاء الحساب ",
                                  onPressed: () {
                                    authCubit.userRegister();
                                  }, color1: ColorsManager.primary,
                                  color2: Colors.white),

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
          child: BlocConsumer<AuthCubit, AuthStates>(
              listener: (context, state) {
                if (state is UserRegisterSuccessState) {
                  Get.to(UserLoginView(
                    cat: 'doctor',
                  ));

                  appMessage(text: 'تم انشاء الحساب بنجاح');

                }

                if (state is UserRegisterErrorState) {

                  appMessage(text: 'خطا في انشاء الحساب');

                }
              },
              builder: (context, state) {
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
                              const SizedBox(height: 20,),

                              const SizedBox(height: 10,),
                              const Custom_Text(text: 'انشاء حساب جديد',
                                fontSize: 24,
                                alignment: Alignment.center,
                                color: Colors.black,
                              ),
                              const SizedBox(height: 20,),

                              const Custom_Text(text:

                              'ادخل البيانات التالية حتى تتمكن من انشاء الحساب والوصول الى اقرب طبيب اليك',
                                fontSize: 17,
                                alignment: Alignment.center,
                                color: Colors.black54,
                              ),


                              const SizedBox(height: 40,),


                              CustomTextFormField(
                                controller: authCubit.nameController,
                                color: Colors.black,
                                hint: "الاسم بالكامل",
                                max: 2,
                                obs: false,
                                obx: false,
                                ontap: () {},
                                type: TextInputType.text,
                              ),
                              const SizedBox(height: 10,),
                              CustomTextFormField(
                                controller: authCubit.emailController,
                                color: Colors.black,
                                hint: "البريد الالكتروني ",
                                max: 2,
                                obs: false,
                                obx: false,
                                ontap: () {},
                                type: TextInputType.text,
                              ),
                              const SizedBox(height: 10,),
                              CustomTextFormField(
                                controller: authCubit.phoneController,
                                color: Colors.black,
                                hint: "رقم الهاتف  ",
                                max: 2,
                                obs: false,
                                obx: false,
                                ontap: () {},
                                type: TextInputType.phone,
                              ),


                              const SizedBox(height: 20,),
                              CustomTextFormField(
                                controller: authCubit.passwordController,
                                color: Colors.black,
                                hint: "كلمة المرور ",
                                obs: true,
                                obx: true,
                                ontap: () {},
                                type: TextInputType.text,
                              ),
                              const SizedBox(height: 30,),

                              // CustomButton(text: "انشاء الحساب ",
                              //     onPressed: () {
                              //       authCubit.registerAndSaveUserRecord(
                              //         selectedOption: sele
                              //       );
                              //     }, color1: ColorsManager.primary,
                              //     color2: Colors.white),

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
