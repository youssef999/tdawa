

import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctors_app/domain/models/ads.dart';
import 'package:doctors_app/presentaion/resources/color_manager.dart';
import 'package:doctors_app/presentaion/views/Home/ads_details_view.dart';
import 'package:doctors_app/presentaion/widgets/Custom_Text.dart';
import 'package:doctors_app/presentaion/widgets/Custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AdsSlider2 extends StatelessWidget {
  List<Ads>adsList;
  AdsSlider2(this.adsList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CarouselSlider(
      options: CarouselOptions(height: 200.0,autoPlay:true),
      items: adsList.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return InkWell(
              child: Container(
             //   height: 120,
                 width: MediaQuery.of(context).size.width*0.8,
                  margin: const EdgeInsets.symmetric(horizontal: 9.0),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          ColorsManager.primary4,
                          ColorsManager.primary4,
                          ColorsManager.white,
                          ColorsManager.primary4,
                          // ColorsManager.primary5,
                          // ColorsManager.primary6,
                          // ColorsManager.primary5,
                          //  Colors.blue,
                        ],

                      )),
                  child:
                  Column(
                    children: [
                      SizedBox(
                          height:90,
                          width: 420,
                          child: Image.network(i.image.toString(),fit:BoxFit.fill)),
                      const SizedBox(height:8,),
                      Custom_Text(
                        text:i.name.toString(),
                        color:ColorsManager.black,
                        alignment:Alignment.center,
                        fontSize: 20,
                      ),
                      const SizedBox(height:5,),
                      CustomButton(
                        text: "احجز الان ",
                        color1:ColorsManager.primary5,
                        color2:Colors.white,
                        onPressed:(){
                          Get.to(AdDetailsView(
                            ad: i,
                          ));
                        },
                      ),
                      const SizedBox(height:10,),

                    ],
                  )
              ),
              onTap:(){

              },
            );
          },
        );
      }).toList(),
    );
  }
}
