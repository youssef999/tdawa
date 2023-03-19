

import 'package:doctors_app/domain/models/ap.dart';
import 'package:doctors_app/domain/models/user.dart';
import 'package:doctors_app/presentaion/bloc/patient/patient_cubit.dart';
import 'package:doctors_app/presentaion/bloc/patient/patient_states.dart';
import 'package:doctors_app/presentaion/resources/color_manager.dart';
import 'package:doctors_app/presentaion/widgets/Custom_Text.dart';
import 'package:doctors_app/presentaion/widgets/appointments/appountments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'doctor-details_view.dart';

class AllDoctorsView extends StatelessWidget {
  String cat2;

  AllDoctorsView(this.cat2);


  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        create: (BuildContext context) => PatientCubit()..getAllDoctors(cat2),
        child: BlocConsumer<PatientCubit, PatientStates>(

            listener: (context, state) {

            },

            builder: (context, state) {

              PatientCubit cubit = PatientCubit.get(context);

              return Scaffold(
                appBar: AppBar(
                  toolbarHeight: 6,
                  backgroundColor: ColorsManager.primary,
                ),
                body: Container(
                  color: Colors.grey[200],
                  child: ListView(
                    children: [

                      if(cat2=='doctor')
                      Container(
                        color: ColorsManager.primary,
                        child: Column(
                          children: const [
                            SizedBox(
                              height: 20,
                            ),
                            Custom_Text(
                              text: ' قائمة الاطباء   ',
                              alignment: Alignment.center,
                              color: Colors.white,
                              fontSize: 25,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                      if(cat2=='hospital')
                        Container(
                          color:ColorsManager.primary,
                          child: Column(
                            children: const [
                              SizedBox(
                                height: 20,
                              ),
                              Custom_Text(
                                text: ' المستشفيات   ',
                                alignment: Alignment.center,
                                color: Colors.white,
                                fontSize: 25,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                      if(cat2=='pharmacy')
                        Container(
                          color:ColorsManager.primary,
                          child: Column(
                            children: const [
                              SizedBox(height: 20,),
                              Custom_Text(
                                text: ' الصيدليات  ',
                                alignment: Alignment.center,
                                color: Colors.white,
                                fontSize: 25,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),



                      const SizedBox(
                        height: 10,
                      ),
                      AllDoctorsWidget(cubit.doctorList,cubit),
                    ],
                  ),
                ),
              );

            }));
  }
}

Widget AllDoctorsWidget(List<DoctorModel> listApp,PatientCubit cubit) {


  return SingleChildScrollView(
    child: Container(
      height:9130,
      color: Colors.grey[200],
      //width:double.infinity,
      padding: const EdgeInsets.only(top: 9, left: 7, right: 7),
      child:
      ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: listApp.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white70),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            SizedBox(
                                height: 80,
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Image.network(
                                    listApp[index].doctor_image.toString())),

                            const SizedBox(
                              width: 50,
                            ),

                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Column(
                                children: [
                                  Custom_Text(
                                    text: listApp[index].doctor_name.toString(),
                                    color: ColorsManager.black,
                                    fontSize: 16,
                                    alignment: Alignment.center,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Custom_Text(
                                    text: listApp[index].doctor_cat.toString(),
                                    color: ColorsManager.primary,
                                    fontSize: 16,
                                    alignment: Alignment.center,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 21,
                                      ),
                                      Custom_Text(
                                        text: 'سعر الكشف '.toString(),
                                        color: Colors.grey,
                                        fontSize: 14,
                                        alignment: Alignment.center,
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Custom_Text(
                                        text: listApp[index].price.toString(),
                                        color: ColorsManager.primary,
                                        fontSize: 16,
                                        alignment: Alignment.center,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                    //         SizedBox(
                    //             width: MediaQuery.of(context).size.width * 0.1),
                    // Positioned(
                    //   top: MediaQuery.of(context).padding.top,
                    //   left: 0,
                    //   right: 0,
                    //   child: Row(
                    //     children: [
                    //       IconButton(onPressed: (){
                    //         if(cubit.fav){
                    //           print("xxx");
                    //           //
                    //     cubit.deleteFromFavList(listApp[index]);
                    //         }
                    //
                    //         else{
                    //           print("yyy");
                    //           cubit.addToFavList(listApp[index]);
                    //         }
                    //       }, icon:
                    //
                    //       Icon(
                    //      cubit.fav?Icons.bookmark:Icons.bookmark_border_outlined,
                    //         color:ColorsManager.purple2,
                    //       ))
                    //     ],
                    //   ),
                    //   //
                    // )
                            //Image.asset('assets/images/vec1.png')
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Get.to(DoctorDetailsView(listApp[index]));
                },
              ),
            );
          }),
    ),
  );
}
