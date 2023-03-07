

 import 'package:doctors_app/presentaion/patient/bloc/patient_cubit.dart';
import 'package:doctors_app/presentaion/patient/bloc/patient_states.dart';
import 'package:doctors_app/presentaion/resources/color_manager.dart';
import 'package:doctors_app/presentaion/widgets/Custom_Text.dart';
import 'package:doctors_app/presentaion/widgets/ads_widget/ads_slider2.dart';
import 'package:doctors_app/presentaion/widgets/ads_widget/ads_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientHomeView extends StatelessWidget {
  const PatientHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return  BlocProvider(
        create:(BuildContext context)=>PatientCubit()..getAllAds(),
        child: BlocConsumer<PatientCubit,PatientStates>(
        listener:(context,state){

    },
    builder:(context,state){

    PatientCubit patientCubit = PatientCubit.get(context);

    return
         Scaffold(
        appBar:AppBar(
          toolbarHeight:7,
          backgroundColor:ColorsManager.primary,

        ),
        body:Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(
            children: [
              const SizedBox(height: 10,),
              Row(
                children: [
                  const SizedBox(width: 12,),
                  InkWell(child: Container(child: Image.asset('assets/images/icon4.png'))),
                  SizedBox(width:MediaQuery.of(context).size.width*0.74,),
                  InkWell(child: Container(
                      height: 60,
                      child: Image.asset('assets/images/logo2.png'))),
                ],
              ),
             const SizedBox(height: 30,),
              AdsSlider(patientCubit.adsList),
              const SizedBox(height: 20,),
            const Custom_Text(text: '---------------',color:ColorsManager.primary,fontSize:17,alignment:Alignment.center),

              const SizedBox(height: 20,),
              Row(
                children: [
                  const SizedBox(width: 20,),
                  Container(
                    decoration:BoxDecoration(
                      borderRadius:BorderRadius.circular(16),
                      color:Colors.white
                    ),
                    width: 120,
                    child: Column(
                      children: [
                        const SizedBox(height: 20,),
                        Image.asset('assets/images/group.png'),
                        const SizedBox(height: 10,),
                        const Custom_Text(text: 'كشف عيادة',
                        color:Colors.black,
                          alignment:Alignment.center,
                          fontSize:20,
                        ),
                        const SizedBox(height: 20,),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Container(
                    decoration:BoxDecoration(
                        borderRadius:BorderRadius.circular(16),
                        color:Colors.white
                    ),
                    width: 120,
                    child: Column(
                      children: [
                        const SizedBox(height: 20,),
                        Image.asset('assets/images/group2.png'),
                        const SizedBox(height: 10,),
                        const Custom_Text(text: 'صيدلية',
                          color:Colors.black,
                          alignment:Alignment.center,
                          fontSize:20,
                        ),
                        const SizedBox(height: 20,),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Container(
                    decoration:BoxDecoration(
                        borderRadius:BorderRadius.circular(16),
                        color:Colors.white
                    ),
                    width: 120,
                    child: Column(
                      children: [
                        const SizedBox(height: 20,),
                        Image.asset('assets/images/group3.png'),
                        const SizedBox(height: 10,),
                        const Custom_Text(text: 'مستشفيات',
                          color:Colors.black,
                          alignment:Alignment.center,
                          fontSize:20,
                        ),
                        const SizedBox(height: 20,),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20,),
                ],
              ),
              const SizedBox(height: 50,),
              AdsSlider2(patientCubit.adsList)


            ],
          ),
        ),

    );
    }

        )
    );
  }
}