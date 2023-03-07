import 'dart:async';
import 'package:doctors_app/presentaion/Home/home_view.dart';
import 'package:doctors_app/presentaion/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




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


    Timer(const Duration(seconds: 5), () async
    {
       Get.to(const HomeView());
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
        body: Container(
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
