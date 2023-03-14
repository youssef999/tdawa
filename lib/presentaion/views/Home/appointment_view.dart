

 import 'package:doctors_app/domain/models/ap.dart';
import 'package:doctors_app/presentaion/resources/color_manager.dart';
import 'package:doctors_app/presentaion/widgets/Custom_Text.dart';
import 'package:doctors_app/presentaion/widgets/appointments/full_appointments.dart';
import 'package:flutter/material.dart';


class AppointmentView extends StatelessWidget {
  List<Appointment> listApp;


  AppointmentView({required this.listApp});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        toolbarHeight: 6,
        backgroundColor:ColorsManager.primary,
      ),
      body:ListView(
        children: [
          const SizedBox(height: 40,),
          const Custom_Text(text: 'الحجوزات  ',
          alignment:Alignment.center,
            color:Colors.black,
            fontSize:25,
          ),
          const SizedBox(height: 10,),
          AppointmentWidget(listApp),
        ],
      ),
    );
  }
}
