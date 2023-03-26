

import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctors_app/domain/models/ads.dart';
import 'package:doctors_app/presentaion/resources/color_manager.dart';
import 'package:doctors_app/presentaion/widgets/Custom_Text.dart';
import 'package:doctors_app/presentaion/widgets/Custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../views/User/Ads/ads_details_view.dart';


 class AdsSlider extends StatelessWidget {
  List <Ads> adsList;
  AdsSlider(this.adsList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final box=GetStorage();
    String c=box.read('country')??"x";

    List<Ads>newList=[];
    // List<Best> newList = adsList.where((now2) =>endDate.isBefore(now) ).toList();

    for(int i=0;i<adsList.length;i++){
      print('HEREXXX');
      DateTime now = DateTime.now();
      DateTime endDate = DateTime.parse(adsList[i].date_end.toString());
      if(endDate.isAfter(now)&&adsList[i].country==c&&adsList[i].best=='true'){
        print('HERETRUEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE');
        newList.add(adsList[i]);
      }
    }
    print("LIST000============"+newList.toString());

   // List<Ads> newList = adsList.where((now2) =>endDate.isBefore(now) ).toList();
    return  CarouselSlider(
      options: CarouselOptions(height: 210.0,autoPlay:true,
        viewportFraction: 0.8,

      ),
      items: newList.map((i) {

        // DateTime now = DateTime.now();
        // DateTime endDate = DateTime.parse(i.date_end.toString());
        // if (endDate.isAfter(now)&&i.country==c) {
          return Builder(
            builder: (BuildContext context) {


              return InkWell(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
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
                            ColorsManager.primary5,
                            ColorsManager.primary5,
                            ColorsManager.primary5,
                            ColorsManager.primary6,
                            ColorsManager.primary5,
                            //  Colors.blue,
                          ],

                        )

                    ),
                    child:
                    Column(
                      children: [
                        SizedBox(
                            height:110,
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

                            Get.to(AdDetailsView(
                              ad: i,
                            ));
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
        // }
        //
        // else{
        //   return Container(
        //     width: 290,
        //     decoration: BoxDecoration(
        //       borderRadius:BorderRadius.circular(17),
        //       color:ColorsManager.primary
        //     ),
        //     child:Image.asset('assets/images/logo.png'),
        //   );
        // }
      }).toList(),
    );
  }
}
