

import 'package:bloc/bloc.dart';
import 'package:doctors_app/presentaion/controller/fav_controller.dart';
import 'package:doctors_app/presentaion/views/Home/home_view.dart';
import 'package:doctors_app/presentaion/views/choose/choose_view.dart';
import 'package:doctors_app/presentaion/views/patient/fav_view.dart';
import 'package:doctors_app/presentaion/views/patient/favo_view.dart';
import 'package:doctors_app/presentaion/views/patient/patient_home_view.dart';
import 'package:doctors_app/presentaion/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'bloc_obs.dart';




void main() async{
  Bloc.observer = MyBlocObserver();
 // await GetStorage.init();
  runApp(const MyApp());
  Get.put(FavController());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
        textDirection: TextDirection.rtl,
        debugShowCheckedModeBanner: false,
        title: 'Doctors',
        theme: ThemeData(
            primarySwatch: Colors.deepPurple
        ),
        home:
        const SplashView()
    );

  }
}


