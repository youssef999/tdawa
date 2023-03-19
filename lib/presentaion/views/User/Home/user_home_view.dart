
import 'package:doctors_app/domain/models/cat.dart';
import 'package:doctors_app/presentaion/bloc/patient/patient_cubit.dart';
import 'package:doctors_app/presentaion/bloc/patient/patient_states.dart';
import 'package:doctors_app/presentaion/resources/color_manager.dart';
import 'package:doctors_app/presentaion/views/User/search/searching_view.dart';
import 'package:doctors_app/presentaion/widgets/Custom_Text.dart';
import 'package:doctors_app/presentaion/widgets/ads_widget/ads_slider2.dart';
import 'package:doctors_app/presentaion/widgets/ads_widget/ads_widget.dart';
import 'package:doctors_app/presentaion/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../doctors/all_doctors_list_view.dart';

class UserHomeView extends StatelessWidget {
  const UserHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  BlocProvider(
        create:(BuildContext context)=>PatientCubit()..getAllAds()..getAllCat(),
        child: BlocConsumer<PatientCubit,PatientStates>(
        listener:(context,state){

    },
    builder:(context,state){

    PatientCubit patientCubit = PatientCubit.get(context);

    return
         Scaffold(
           backgroundColor: Colors.grey[200],
        appBar:AppBar(
          toolbarHeight:90,
          backgroundColor:ColorsManager.primary,
          title:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [

                SizedBox(width:MediaQuery.of(context).size.width*0.25,),
                SizedBox(
                    height: 70,
                    child: Image.asset('assets/images/logo.png')),
             //   const Text('Tdawa',style:TextStyle(fontSize: 21),),
                SizedBox(width:MediaQuery.of(context).size.width*0.25,),
                    InkWell(child: const Icon(Icons.search,color:ColorsManager.white,size:33),
                      onTap:(){
                        Get.to(const SearchLayout());
                      },
                     ),
              ],
            ),
          )

        ),
        drawer: const MainDrawer(),
        body:Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(
            children: [

             const SizedBox(height: 30,),
              AdsSlider(patientCubit.adsList),
              const SizedBox(height: 20,),
            const Custom_Text(text: '- - - - - - - - - ',color:ColorsManager.primary,fontSize:23
                ,alignment:Alignment.center),

              const SizedBox(height: 20,),
              CatWidget(patientCubit.catList),

              const SizedBox(height: 10,),
              const Custom_Text(text: '- - - - - - - - - ',color:ColorsManager.primary,fontSize:23
                  ,alignment:Alignment.center),
              const SizedBox(height: 20,),
              AdsSlider2(patientCubit.adsList),

              const SizedBox(height: 34,),

            ],
          ),
        ),

    );
    }

        )
    );
  }
}

Widget CatWidget(List<Cat> catList){

  double height=300;
  if(catList.length>4){
    height=400;
  }

  if(catList.length>6){
    height=500;
  }
  if(catList.length>8){
    height=600;
  }
  if(catList.length>10){
    height=700;
  }

  return   SizedBox(
    height: height,
    child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 230,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20),
        itemCount: catList.length,


        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white70),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                          height: 70,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Image.network(
                              catList[index].image.toString())),
                      // const SizedBox(
                      //  height: 30,
                      // ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Column(
                          children: [
                            Custom_Text(
                              text: catList[index].name.toString(),
                              color: ColorsManager.black,
                              fontSize: 16,
                              alignment: Alignment.center,
                            ),
                            const SizedBox(
                              height: 10,
                            ),

                          ],
                        ),
                      ),

                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.1),

                    ],
                  ),
                ),
              ),
              onTap: () {

                print(AllDoctorsView(catList[index].cat2));
                Get.to(AllDoctorsView(catList[index].cat2));
              },
            ),
          );
        }),
  );

}