

import 'package:bloc/bloc.dart';
import 'package:doctors_app/presentaion/Home/home_view.dart';
import 'package:doctors_app/presentaion/Home/tdawa_plus_view.dart';
import 'package:doctors_app/presentaion/auth/login_view.dart';
import 'package:doctors_app/presentaion/auth/register_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bloc_obs.dart';
import 'presentaion/splash/splash_screen.dart';


void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doctors',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      home://const TdawaPlusView()
      //const HomeView()
      const SplashView()
     // RegisterView()
    );
  }
}


