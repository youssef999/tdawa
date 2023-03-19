
import 'package:doctors_app/domain/models/bouquet.dart';
import 'package:doctors_app/presentaion/resources/color_manager.dart';
import 'package:doctors_app/presentaion/views/Doctor/doctor_ads/create_ad_view.dart';
import 'package:doctors_app/presentaion/widgets/Custom_Text.dart';
import 'package:doctors_app/presentaion/widgets/Custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BakaWidget extends StatelessWidget {

  List<Baka> bakaList;

  BakaWidget({required this.bakaList});

  @override
  Widget build(BuildContext context) {


    return  SingleChildScrollView(
      child: Container(
        height: 630,
        //width:double.infinity,
        padding:const EdgeInsets.only(top:9,left:7,right:7),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
           // physics: const NeverScrollableScrollPhysics(),
            itemCount: bakaList.length,
            itemBuilder: (context, index) {
              return
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width:MediaQuery.of(context).size.width*0.43,
                    decoration:BoxDecoration(
                        borderRadius:BorderRadius.circular(20),
                        color:ColorsManager.white
                    ),
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Column(
                            children: [
                              const SizedBox(height: 10,),
                              Custom_Text(text: bakaList[index].name.toString(),
                                fontSize:19,
                                color:Colors.black,
                                alignment:Alignment.center,
                              ),
                              const SizedBox(height: 50,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Custom_Text(text: bakaList[index].details.toString(),
                                  fontSize:19,
                                  color:Colors.black,
                                  alignment:Alignment.center,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Custom_Text(text: bakaList[index].description.toString(),
                                  fontSize:14,
                                  color:ColorsManager.primary,
                                  alignment:Alignment.center,
                                ),
                              ),
                              const SizedBox(height: 60,),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Custom_Text(text: 'سعر الباقة',
                                  fontSize:17,
                                  color:Colors.black,
                                  alignment:Alignment.center,
                                ),
                              ),
                              Positioned(
                                bottom:10,
                                child: Card(
                                  color:ColorsManager.primary,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Custom_Text(
                                      text: bakaList[index].price.toString(),
                                      fontSize:20,
                                      color:Colors.white,
                                      alignment:Alignment.center,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30,),
                              const Divider(
                                color:Colors.grey,
                                height: 6,
                              ),

                             Padding(
                                padding: const EdgeInsets.only(right: 20.0,top:20),
                                child: Column(
                                  children: [
                                    const Custom_Text(text: 'مميزات الباقة : ',
                                    color:Colors.black,
                                      alignment:Alignment.topRight,
                                      fontSize:20,
                                    ),
                                    const SizedBox(height: 10,),
                                    Container(
                                      height: 90,
                                      child: Custom_Text(text:bakaList[index].adv,
                                        color:ColorsManager.primary,
                                        alignment:Alignment.topRight,
                                        fontSize:14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 30,),
                              CustomButton(
                                text: 'اختار الباقة',
                                color1:ColorsManager.primary,
                                color2:Colors.white,
                                onPressed:(){


                                  Get.to( CreateAdView(
                                    days: bakaList[index].days,
                                  ));
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap:(){
                       // tdawaCubit.dispalyFirst();
                        // tdawaCubit. getDocotorAppointments();

                      },
                    ),
                  ),
                );
            }),
      ),
    );
  }
}
