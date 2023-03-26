


 import 'package:doctors_app/presentaion/const/app_message.dart';
import 'package:doctors_app/presentaion/resources/color_manager.dart';
import 'package:doctors_app/presentaion/views/sales/sales_view.dart';
import 'package:doctors_app/presentaion/widgets/Custom_button.dart';
import 'package:doctors_app/presentaion/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SalesCodeView extends StatelessWidget {
  const SalesCodeView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    TextEditingController code=TextEditingController();
    return Scaffold(
      appBar:AppBar(
        toolbarHeight: 3,
        elevation: 0,
        backgroundColor:ColorsManager.primary,
      ),
      body:Column(
        children:  [
          //const SizedBox(height: 20,),
          Container(
            height: 220,
            width: 700,
            decoration: BoxDecoration(
              color:ColorsManager.primary,
              borderRadius:BorderRadius.circular(1)
            ),
            child: Image.asset('assets/images/logo.png'),
          ),
          const SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CustomTextFormField(
              controller: code,
              color:Colors.black,
              obx: false,
              obs: false,
              type:TextInputType.text,
              hint: ' كود المندوبين  ',
              ontap:(){},
              max: 2,
              input: false,
            ),
          ),
          const SizedBox(height: 20,),
          CustomButton(
            text: 'التالي',
            color1:ColorsManager.primary,
            color2:Colors.white,
            onPressed:(){
              if(code.text=='123456'){
                Get.to(const SalesView());
              }else{
                appMessage(text: 'كود خاطئ');
              }
            },
          )
        ],
      ),
    );
  }
}
