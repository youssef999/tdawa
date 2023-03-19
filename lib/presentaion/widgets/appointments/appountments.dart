import 'package:doctors_app/domain/models/ap.dart';
import 'package:doctors_app/presentaion/resources/color_manager.dart';
import 'package:doctors_app/presentaion/widgets/Custom_Text.dart';
import 'package:flutter/material.dart';


class FullAppointmentWidget extends StatelessWidget {

  List<Appointment> listApp;

  FullAppointmentWidget(this.listApp, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    if(listApp.isNotEmpty){
      return  SingleChildScrollView(
        child: Container(
          height: 230,
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
                        child: Column(
                          children: [
                            const SizedBox(height: 5,),
                            Container(
                                height: 60,
                                child: Image.asset('assets/images/person.png')),
                            const SizedBox(height: 10,),
                            Custom_Text(text:      listApp[index].userName,color:Colors.black,
                              fontSize:20,alignment:Alignment.center,
                            ),
                            const SizedBox(height: 10,),
                          ],
                        ),
                      ),
                      onTap:(){

                      },
                    ),
                  );
              }),
        ),
      );
    }else{

      return Container(
        height: 90,
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(13),
          color:ColorsManager.primary
        ),
        child: Column(
          children: const [
            SizedBox(height: 40,),
            Custom_Text(text: 'لا توجد اي حجوزات الان ',color:Colors.white,
            fontSize:23,alignment:Alignment.center,
            )
          ],
        ),
      );
    }

  }
}
