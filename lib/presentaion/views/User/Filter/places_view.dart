
import 'package:doctors_app/presentaion/bloc/patient/patient_cubit.dart';
import 'package:doctors_app/presentaion/bloc/patient/patient_states.dart';
import 'package:doctors_app/presentaion/resources/color_manager.dart';
import 'package:doctors_app/presentaion/widgets/Custom_Text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../../domain/models/places2.dart';
import 'Filter_doctors_view.dart';


class PlacesView extends StatelessWidget {

String place;


PlacesView({required this.place});

@override

  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => PatientCubit()..getAllPlaces2(place),
        child: BlocConsumer<PatientCubit, PatientStates>(

            listener: (context, state) {

            },

            builder: (context, state) {

              PatientCubit cubit = PatientCubit.get(context);

              return Scaffold(
                appBar: AppBar(
                  toolbarHeight: 6,
                  elevation: 0,
                  backgroundColor: ColorsManager.primary,
                ),
                body: Container(
                  color: Colors.grey[200],
                  child: ListView(
                    children: [

                      Container(
                        color:ColorsManager.primary,
                        child: Column(
                          children: const [
                            SizedBox(
                              height: 20,
                            ),
                            Custom_Text(
                              text: ' Tdawa    ',
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
                      PlacesWidget(cubit.placesList2,cubit),
                      // AllFiltersWidget(cubit.filterList,cubit),
                    ],
                  ),
                ),
              );

            }));
  }
}


 Widget PlacesWidget(List<Places2> listApp,PatientCubit cubit){

  if(listApp.isNotEmpty) {
    return SingleChildScrollView(
      child: Container(
        height: 9130,
        color: Colors.grey[200],
        padding: const EdgeInsets.only(top: 9, left: 7, right: 7),
        child:
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: listApp.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ColorsManager.primary),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        Column(
                          children: [


                            const SizedBox(
                              height: 23,
                            ),

                            SizedBox(
                              // width: MediaQuery.of(context).size.width * 0.3,
                              child:

                              Column(
                                children: [
                                  Custom_Text(
                                    text: listApp[index].name.toString(),
                                    color: ColorsManager.white,
                                    fontSize: 26,
                                    alignment: Alignment.center,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),


                                ],
                              ),
                            ),


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
                  Get.to(FiltersDoctorView(
                    place2:  listApp[index].name.toString(),
                  ));
                },
              ),
            );
          },
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 230,
            childAspectRatio: 3.2 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20),

        ),
      ),
    );
  }else{

    return    Container(
      color:Colors.white,
      child:

      Center(
        child:

        Column(
          mainAxisAlignment:MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            SizedBox(
              height:260,
              child:Image.asset("assets/images/data.png"),
            ),
            const SizedBox(height: 11,),
            const Custom_Text(
              text: 'القسم لا يحتوي علي بيانات الان ',
              fontSize: 22,
              color:Colors.black,
              alignment:Alignment.center,
            ),
            const SizedBox(height: 400,),

          ],
        ),
      ),
    );

  }
}
