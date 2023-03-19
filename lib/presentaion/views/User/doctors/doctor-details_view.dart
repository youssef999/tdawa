

 import 'dart:io';

import 'package:doctors_app/domain/models/user.dart';
import 'package:doctors_app/presentaion/resources/color_manager.dart';
import 'package:doctors_app/presentaion/widgets/Custom_Text.dart';
import 'package:doctors_app/presentaion/widgets/Custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../booking/book_view.dart';

class DoctorDetailsView extends StatelessWidget {

  DoctorModel doctorData;

  DoctorDetailsView(this.doctorData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        toolbarHeight: 6,
        backgroundColor:ColorsManager.primary,
      ),
      body:Directionality(
        textDirection:TextDirection.rtl,
        child:

        Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              const SizedBox(height: 20,),
              SizedBox(
                height: 200,
                child:Image.network(doctorData.doctor_image.toString()),
              ),
              const SizedBox(height: 30,),
              Row(
                children: [
                  Custom_Text(
                    text: doctorData.doctor_name.toString(),
                    color:ColorsManager.black,
                    fontSize: 20,
                    alignment:Alignment.topRight,
                  ),
                  const SizedBox(width: 40,),
                  Custom_Text(
                    alignment:Alignment.topRight,
                    text: doctorData.doctor_cat.toString(),
                    color:ColorsManager.primary,
                    fontSize: 20,
                  ),
                ],
              ),

              const SizedBox(height: 15,),
              Row(
                children: [

                  const Icon(Icons.phone,color:ColorsManager.primary,),
                  const SizedBox(width: 20,),
                  Custom_Text(text:doctorData.doctor_phone.toString(),alignment:Alignment.topRight,
                    fontSize:15,
                    color:ColorsManager.black,
                  ),

                ],
              ),
              const SizedBox(height: 15,),


              (doctorData.address.toString()!='')?

              Row(
                children: [

                  const Icon(Icons.place,color:ColorsManager.primary,),
                  const SizedBox(width: 20,),
                  Custom_Text(text: doctorData.address.toString(),alignment:Alignment.topRight,
                    fontSize:15,
                    color:ColorsManager.black,
                  ),
                  const SizedBox(width: 10,),
                  Custom_Text(text: doctorData.time.toString(),alignment:Alignment.topRight,
                    fontSize:15,
                    color:ColorsManager.black,
                  ),

                ],
              ) :const SizedBox(),
              const SizedBox(height: 15,),
              InkWell(
                child: Row(
                  children: const [
                    SizedBox(width: 60,),
                    Icon(Icons.maps_ugc_sharp,color:ColorsManager.primary,),
                    SizedBox(width: 20,),
                    Custom_Text(text: 'موقع الطبيب  علي الخريطة    -  ',alignment:Alignment.center,
                      fontSize:15,
                      color:Colors.grey,
                    ),
                    SizedBox(width: 10,),

                  ],
                ),
                onTap:(){
                  url(doctorData.location.toString());
                },
              ),
              // Row(
              //   children: [
              //
              //     const Icon(Icons.timelapse,color:ColorsManager.primary,),
              //     const SizedBox(width: 20,),
              //     const Custom_Text(text: 'الميعاد   -  ',alignment:Alignment.topRight,
              //       fontSize:15,
              //       color:ColorsManager.black,
              //     ),
              //     const SizedBox(width: 10,),
              //     Custom_Text(text: doctorData.time.toString(),alignment:Alignment.topRight,
              //       fontSize:15,
              //       color:ColorsManager.black,
              //     ),
              //
              //   ],
              // ),

              const SizedBox(height: 10,),
              (doctorData.address2.toString()!='')?

              Row(
                children: [

                  const Icon(Icons.place,color:ColorsManager.primary,),
                  const SizedBox(width: 20,),
                  Custom_Text(text: doctorData.address2.toString(),alignment:Alignment.topRight,
                    fontSize:15,
                    color:ColorsManager.black,
                  ),
                  const SizedBox(width: 10,),
                  Custom_Text(text: doctorData.time2.toString(),alignment:Alignment.topRight,
                    fontSize:15,
                    color:ColorsManager.black,
                  ),

                ],
              ) :const SizedBox(),


              const SizedBox(height: 15,),
              if(doctorData.location2!='')
              InkWell(
                child: Row(
                  children: const [
                    SizedBox(width: 60,),
                    Icon(Icons.maps_ugc_sharp,color:ColorsManager.primary,),
                    SizedBox(width: 20,),
                    Custom_Text(text: 'موقع الطبيب  علي الخريطة    -  ',alignment:Alignment.center,
                      fontSize:15,
                      color:Colors.grey,
                    ),
                    SizedBox(width: 10,),

                  ],
                ),
                onTap:(){
                  url(doctorData.location2.toString());
                },
              ),


              const SizedBox(height: 15,),
              (doctorData.address3.toString()!='')?

              Row(
                children: [

                  const Icon(Icons.place,color:ColorsManager.primary,),
                  const SizedBox(width: 20,),
                  Custom_Text(text: doctorData.address3.toString(),alignment:Alignment.topRight,
                    fontSize:15,
                    color:ColorsManager.black,
                  ),
                  const SizedBox(width: 10,),
                  Custom_Text(text: doctorData.time2.toString(),alignment:Alignment.topRight,
                    fontSize:15,
                    color:ColorsManager.black,
                  ),
                ],
              ) :const SizedBox(),

              const SizedBox(height: 15,),
              if(doctorData.location3!='')
                InkWell(
                  child: Row(
                    children: const [
                      SizedBox(width: 60,),
                      Icon(Icons.maps_ugc_sharp,color:ColorsManager.primary,),
                      SizedBox(width: 20,),
                      Custom_Text(text: 'موقع الطبيب  علي الخريطة    -  ',alignment:Alignment.center,
                        fontSize:15,
                        color:Colors.grey,
                      ),
                      SizedBox(width: 10,),

                    ],
                  ),
                  onTap:(){
                    url(doctorData.location3.toString());
                  },
                ),

              const SizedBox(height: 25,),
              Row(
                children: [

                  const Icon(Icons.price_change,color:ColorsManager.primary,),
                  const SizedBox(width: 20,),
                  const Custom_Text(text: 'السعر   -  ',alignment:Alignment.topRight,
                    fontSize:15,
                    color:ColorsManager.black,
                  ),
                  const SizedBox(width: 10,),
                  Custom_Text(text: doctorData.price.toString(),alignment:Alignment.topRight,
                    fontSize:15,
                    color:ColorsManager.black,
                  ),

                ],
              ),
              const SizedBox(height: 25,),



              const Padding(
                padding: EdgeInsets.only(left:36.0,right:36.0),
                child: Divider(
                  height:6,
                  color:Colors.black,
                ),
              ),
              const SizedBox(height: 15,),
              Row(
                children: [

                  Container(
                    child: Image.asset('assets/images/profile.png'),
                  ),
                  const SizedBox(width: 20,),
                  const Custom_Text(text: ' معلوماتي  ',alignment:Alignment.topRight,
                    fontSize:24,
                    color:ColorsManager.black,
                  ),
                  const SizedBox(width: 10,),


                ],
              ),
              const SizedBox(height: 15,),




              Custom_Text(text: doctorData.doctor_info.toString(),alignment:Alignment.center,
                fontSize:15,
                color:ColorsManager.black,
              ),
              const SizedBox(height: 22,),
              Row(
                children: [

                  Container(
                    child: Image.asset('assets/images/grade.png'),
                  ),
                  const SizedBox(width: 20,),
                  const Custom_Text(text: ' الدرجة العلمية ',alignment:Alignment.topRight,
                    fontSize:24,
                    color:ColorsManager.black,
                  ),
                  const SizedBox(width: 10,),


                ],
              ),

              const SizedBox(height: 12,),
              Custom_Text(text: doctorData.doctor_degree.toString(),alignment:Alignment.center,
                fontSize:15,
                color:ColorsManager.black,
              ),

              const SizedBox(height: 20,),

              CustomButton(
                text: "احجز الان ",
                color1:ColorsManager.primary,
                color2:Colors.white,
                onPressed:(){
                  Get.to( BookingView(
                    doctorId: doctorData.doctor_id.toString(),
                    days: doctorData.days.toString(),
                  ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
 String url(String link) {

   if (Platform.isAndroid) {
     // add the [https]
     return link; // new line
   } else {
     // add the [https]
     return link;// new line
   }

 }