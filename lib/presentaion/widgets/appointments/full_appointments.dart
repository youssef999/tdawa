import 'package:doctors_app/domain/models/ap.dart';
import 'package:doctors_app/presentaion/bloc/tdawa/tdawa_cubit.dart';
import 'package:doctors_app/presentaion/resources/color_manager.dart';
import 'package:doctors_app/presentaion/widgets/Custom_Text.dart';
import 'package:flutter/material.dart';

import '../../../domain/models/booking.dart';


class AppointmentWidget extends StatelessWidget {

  List<Booking> listApp;
  TdawaCubit cubit;

  AppointmentWidget(this.listApp,this.cubit, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  SingleChildScrollView(
      child: Container(
        height: 12230,
        color:Colors.grey[100],
        //width:double.infinity,
        padding:const EdgeInsets.only(top:9,left:7,right:7),
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: listApp.length,
            itemBuilder: (context, index) {
              return
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Container(
                      decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(15),
                          color:Colors.white70
                      ),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Column(
                          children: [
                            const SizedBox(height: 5,),
                            Row(
                              children: [
                                SizedBox(
                                    height: 60,
                                    child: Image.asset('assets/images/person.png')),

                                const SizedBox(width:100,),
                                Custom_Text(text: listApp[index].date.toString().replaceAll('00:00:00.000','')
                                  ,color:ColorsManager.primary,
                                  fontSize:16,alignment:Alignment.center,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10,),
                            Row(
                              children: [
                                const SizedBox(width: 140,),
                                Custom_Text(text:      listApp[index].name.toString(),color:Colors.black,
                                  fontSize:20,alignment:Alignment.center,
                                ),
                                const SizedBox(width: 70,),
                                Column(
                                  children: [
                                    Custom_Text(text:      'اليوم ',color:Colors.black,
                                      fontSize:20,alignment:Alignment.center,
                                    ),
                                    const SizedBox(height: 10,),
                                    Custom_Text(text:      listApp[index].day.toString(),color:Colors.grey,
                                      fontSize:16,alignment:Alignment.center,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 10,),

                            const SizedBox(height: 10,),
                            Row(
                              children: [
                                const SizedBox(width: 30,),
                                Custom_Text(text:      'رقم الهاتف',color:ColorsManager.primary,
                                  fontSize:14,alignment:Alignment.center,
                                ),
                                const SizedBox(width: 30,),
                                Custom_Text(text:      listApp[index].phone.toString(),color:ColorsManager.primary,
                                  fontSize:14,alignment:Alignment.center,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20,),


                          ],
                        ),
                      ),
                    ),
                    onTap:(){

                    },
                  ),
                );
            }),
      ),
    );

  }
}
