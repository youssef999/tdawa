
import 'package:doctors_app/presentaion/bloc/doc_profile/doctor_cubit.dart';
import 'package:doctors_app/presentaion/bloc/doc_profile/doctor_states.dart';
import 'package:doctors_app/presentaion/resources/color_manager.dart';
import 'package:doctors_app/presentaion/views/HomeApp/choose/choose_view.dart';
import 'package:doctors_app/presentaion/widgets/Custom_Text.dart';
import 'package:doctors_app/presentaion/widgets/Custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class DoctorProfileView extends StatelessWidget {
  const DoctorProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    int x=0;
    return BlocProvider(
        create: (BuildContext context) => DoctorCubit()..getDocotorData(),
        child: BlocConsumer<DoctorCubit, DoctorStates>(
        listener: (context, state) {

          if(state is getDoctorDataSuccessState ){
            x=1;
          }

        },
    builder: (context, state) {

      DoctorCubit doctorCubit = DoctorCubit.get(context);

      if(x==1){
        return Scaffold(
          appBar:AppBar(
            toolbarHeight: 5,
            elevation: 0,
            backgroundColor:ColorsManager.primary,
          ),
          body:
          Directionality(
            textDirection:TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children:  [
                  const SizedBox(height: 20,),
                  SizedBox(
                    height:190,
                    width:400,
                    child:Image.network(doctorCubit.doc.doctor_image.toString(),fit:BoxFit.scaleDown),),
                  const SizedBox(height: 20,),
                  Custom_Text(text: doctorCubit.doc.doctor_name.toString(),alignment:Alignment.topRight,
                    fontSize:21,
                    color:ColorsManager.primary,
                  ),
                  const SizedBox(height: 15,),
                  Custom_Text(text: doctorCubit.doc.doctor_cat.toString(),alignment:Alignment.topRight,
                    fontSize:15,
                    color:ColorsManager.black,
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    children: [

                      const Icon(Icons.phone,color:ColorsManager.primary,),
                      const SizedBox(width: 20,),
                      Custom_Text(text: doctorCubit.doc.doctor_phone.toString(),alignment:Alignment.topRight,
                        fontSize:15,
                        color:ColorsManager.black,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      const Icon(Icons.place,color:ColorsManager.primary,),
                      const SizedBox(width: 20,),
                      Custom_Text(text: doctorCubit.doc.position.toString(),alignment:Alignment.topRight,
                        fontSize:15,
                        color:ColorsManager.black,
                      ),

                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    children: [

                      const Icon(Icons.price_change,color:ColorsManager.primary,),
                      const SizedBox(width: 20,),
                      const Custom_Text(text: 'السعر   -  ',alignment:Alignment.topRight,
                        fontSize:15,
                        color:ColorsManager.black,
                      ),
                      const SizedBox(width: 10,),
                      Custom_Text(text: doctorCubit.doc.price.toString(),alignment:Alignment.topRight,
                        fontSize:15,
                        color:ColorsManager.black,
                      ),

                    ],
                  ),
                  const SizedBox(height: 15,),
                  const Padding(
                    padding: EdgeInsets.only(left:36.0,right:36.0),
                    child: Divider(
                      height:6,
                      color:Colors.black,
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    children: [

                      Container(
                        child: Image.asset('assets/images/profile.png'),
                      ),
                      const SizedBox(width: 20,),
                      const Custom_Text(text: ' معلوماتي  ',alignment:Alignment.topRight,
                        fontSize:24,
                        color:ColorsManager.black,
                      ),
                      const SizedBox(width: 10,),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Custom_Text(text: doctorCubit.doc.doctor_info.toString(),alignment:Alignment.center,
                    fontSize:15,
                    color:ColorsManager.black,
                  ),
                  const SizedBox(height: 22,),
                  Row(
                    children: [

                      Image.asset('assets/images/grade.png'),
                      const SizedBox(width: 20,),
                      const Custom_Text(text: ' الدرجة العلمية ',alignment:Alignment.topRight,
                        fontSize:24,
                        color:ColorsManager.black,
                      ),
                      const SizedBox(width: 10,),
                    ],
                  ),

                  const SizedBox(height: 12,),
                  Custom_Text(text: doctorCubit.doc.doctor_degree.toString(),alignment:Alignment.center,
                    fontSize:15,
                    color:ColorsManager.black,
                  ),
                  const SizedBox(height: 22,),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CustomButton(
                      text: 'تسجيل خروج',
                      color1:ColorsManager.primary,
                      color2:Colors.white,
                      onPressed:(){
                        final box=GetStorage();
                        box.remove('doc_Id');
                        Get.offAll(const ChooseView());
                      },
                    ),
                  )

                ],
              ),
            ),
          ),
        );
      }else{
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

    }));
  }
}
