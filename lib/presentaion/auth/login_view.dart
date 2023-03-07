

import 'package:another_flushbar/flushbar.dart';
import 'package:doctors_app/presentaion/resources/color_manager.dart';
import 'package:doctors_app/presentaion/widgets/Custom_Text.dart';
import 'package:doctors_app/presentaion/widgets/Custom_button.dart';
import 'package:doctors_app/presentaion/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_cubit.dart';
import 'auth_states.dart';


class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return

      BlocProvider(
        create: (BuildContext context) => AuthCubit(),
        child: BlocConsumer<AuthCubit, AuthStates>(
            listener: (context, state) {

              if(state is RegisterSuccessState){

              }

              if(state is RegisterErrorState){




                Flushbar(
                  padding: const EdgeInsets.all(8),
                  flushbarPosition:FlushbarPosition.TOP,
                  message: " رقمك مسجل بالفعل او ادخلت بيانات بشكل خاطئ ",
                  icon: const Icon(Icons.error,
                      size: 28.0, color: ColorsManager.primary),
                  duration: const Duration(seconds: 3),
                  leftBarIndicatorColor: Colors.black,
                  backgroundColor:ColorsManager.black,)
                    .show(context);
              }
            },
            builder: (context, state) {

              AuthCubit authCubit = AuthCubit.get(context);

              return Scaffold(
                backgroundColor:ColorsManager.white,
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
                        padding: const EdgeInsets.only(left:8.0,right:8),
                        child: Column(
                          children:  [
                            const SizedBox(height: 10,),
                            SizedBox(
                              height: 150,
                              child:Image.asset('assets/images/doctor.png'),),
                            const SizedBox(height: 10,),
                            const Custom_Text(text: 'تسجيل دخول ',
                              fontSize:24,
                              alignment:Alignment.center,
                              color:Colors.black,
                            ),
                            const SizedBox(height: 20,),

                            CustomTextFormField(
                              controller:authCubit.emailController,
                              color:Colors.black,
                              hint: "البريد الالكتروني ",
                              max: 2,
                              obs: false,
                              obx: false,
                              ontap:(){},
                              type:TextInputType.text,
                            ),
                            const SizedBox(height: 10,),

                            const SizedBox(height: 10,),
                            CustomTextFormField(
                              controller:authCubit.passwordController,
                              color:Colors.black,
                              hint: "كلمة المرور ",
                              obs: true,
                              obx: true,
                              ontap:(){},
                              type:TextInputType.text,
                            ),
                            const SizedBox(height: 20,),
                            CustomButton(text: "تسجيل",
                                onPressed: (){

                              authCubit.login();

                                },
                                color1:ColorsManager.primary,
                                color2: Colors.white),
                            const SizedBox(height: 30,),
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
