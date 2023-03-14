import 'dart:async';
import 'package:doctors_app/presentaion/resources/color_manager.dart';
import 'package:doctors_app/presentaion/views/Home/dash_board.dart';
import 'package:doctors_app/presentaion/views/Home/home_view.dart';
import 'package:doctors_app/presentaion/views/choose/choose_view.dart';
import 'package:doctors_app/presentaion/views/patient/patient_home_view.dart';
import 'package:doctors_app/presentaion/views/splash/splash_screen2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';




class SplashView extends StatefulWidget
{
  const SplashView({Key? key}) : super(key: key);

  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}
class _MySplashScreenState extends State<SplashView>
{

  startTimer()
  {

    final box=GetStorage();
    String docId=box.read('doc_Id')??'x';
    // String docId=box.read('doc_Id');
    // String email=box.read('email');
    String userId=box.read('userId')??'x';
    Timer(const Duration(seconds: 5), () async
    {
      if(docId !='x'){

       Get.offAll(const HomeView());

      }

      else if(userId!='x'){

        Get.offAll(const DashBoardFragment());

      }
      else{
        Get.offAll(const ChooseView());
      }

    });

  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }
  
  @override
  Widget build(BuildContext context)
  {
    return
     Scaffold(
        appBar: AppBar(
          toolbarHeight: 10,
          backgroundColor:ColorsManager.primary,
        ),
        body:

        Container(
          color: Colors.white,
          child:   Center(
            child: Container(
                color:ColorsManager.white,
                height: 290, child:
            CircleAvatar(
               backgroundColor: ColorsManager.primary,
                radius: 120,
                child: Image.asset('assets/images/logo.png',fit:BoxFit.fill,))),
          ),
        )
    );
  }
}