

import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctors_app/domain/models/ads.dart';
import 'package:doctors_app/presentaion/resources/color_manager.dart';
import 'package:doctors_app/presentaion/widgets/Custom_Text.dart';
import 'package:doctors_app/presentaion/widgets/Custom_button.dart';
import 'package:flutter/material.dart';


class AdsSlider2 extends StatelessWidget {
  List<Ads>adsList;
  AdsSlider2(this.adsList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CarouselSlider(
      options: CarouselOptions(height: 320.0,autoPlay:true),
      items: adsList.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return InkWell(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                        colors: [
                          ColorsManager.primary4,
                          ColorsManager.primary4,
                        ],
                        begin: FractionalOffset(0.0, 0.4),
                        end: Alignment.topRight,
                      )),
                  child:
                  Column(
                    children: [
                      SizedBox(
                          height:160,
                          width: 420,
                          child: Image.network(i.image.toString(),fit:BoxFit.fill)),
                      const SizedBox(height:8,),
                      Custom_Text(
                        text:i.name.toString(),
                        color:ColorsManager.white,
                        alignment:Alignment.center,
                        fontSize: 16,
                      ),
                      const SizedBox(height:5,),
                      CustomButton(
                        text: "احجز الان ",
                        color1:ColorsManager.white,
                        color2:ColorsManager.primary,
                        onPressed:(){
                        },
                      ),
                      const SizedBox(height:12,),

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
