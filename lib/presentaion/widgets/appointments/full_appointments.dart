import 'package:doctors_app/domain/models/ap.dart';
import 'package:doctors_app/presentaion/resources/color_manager.dart';
import 'package:doctors_app/presentaion/widgets/Custom_Text.dart';
import 'package:flutter/material.dart';


class AppointmentWidget extends StatelessWidget {

  List<Appointment> listApp;

  AppointmentWidget(this.listApp, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return  SingleChildScrollView(
      child: Container(
        height: 1230,
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

                                const SizedBox(width:30,),
                                Custom_Text(text: listApp[index].date.toString().replaceAll('00:00:00.000','')
                                  ,color:ColorsManager.primary,
                                  fontSize:16,alignment:Alignment.center,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10,),
                            Row(
                              children: [
                                const SizedBox(width: 10,),
                                Custom_Text(text:      listApp[index].userName,color:Colors.black,
                                  fontSize:20,alignment:Alignment.center,
                                ),
                                const SizedBox(width:30,),
                                Custom_Text(text:      listApp[index].time,color:Colors.grey,
                                  fontSize:15,alignment:Alignment.center,
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.5,),
                                InkWell(
                                  child:Image.asset("assets/images/delete.png"),
                                  onTap:(){

                                    print("delete");

                                  }
                                  ,
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
