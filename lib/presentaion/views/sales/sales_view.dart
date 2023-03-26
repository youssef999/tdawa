


 import 'package:doctors_app/presentaion/resources/color_manager.dart';
import 'package:doctors_app/presentaion/views/Doctor/doctor_reg/register_view.dart';
import 'package:doctors_app/presentaion/widgets/Custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SalesView extends StatefulWidget {
  const SalesView({Key? key}) : super(key: key);

  @override
  State<SalesView> createState() => _SalesViewState();
}

class _SalesViewState extends State<SalesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation: 0,
        toolbarHeight: 2,
        backgroundColor:ColorsManager.primary,
      ),
      body:Column(
        children:  [
         // const SizedBox(height: 20,),
          Container(
            height: 200,
            width: 700,
            decoration:BoxDecoration(
              borderRadius:BorderRadius.circular(1),
              color:ColorsManager.primary
            ),
            child:Image.asset('assets/images/logo.png'),
          ),
          const SizedBox(height: 60,),
          CustomButton(
            text: 'انشاء حساب لطبيب',
            color1:ColorsManager.primary,
            color2:Colors.white,
            onPressed:(){
              Get.to( RegisterView());
            },
          )
        ],
      )
    );
  }
}
