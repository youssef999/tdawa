
import 'package:doctors_app/presentaion/bloc/tdawa/tdawa_cubit.dart';
import 'package:doctors_app/presentaion/bloc/tdawa/tdawa_states.dart';
import 'package:doctors_app/presentaion/resources/color_manager.dart';
import 'package:doctors_app/presentaion/views/Doctor/Payment/tdawa_plus_view.dart';
import 'package:doctors_app/presentaion/widgets/Custom_Text.dart';
import 'package:doctors_app/presentaion/widgets/Custom_button.dart';
import 'package:doctors_app/presentaion/widgets/appointments/appountments.dart';
import 'package:doctors_app/presentaion/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../Appointments/appointment_view.dart';

class HomeView extends StatelessWidget {
  String type;
   HomeView({Key? key,required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    int x=0;

    return BlocProvider(
        create: (BuildContext context) => TdawaCubit()..getDoctorData()..getDocotorBoking(),
        child: BlocConsumer<TdawaCubit, TdawaStates>(
            listener: (context, state) {
              if(state is getDoctorDataSuccessState ){
                x=1;
              }
              if(state is getDoctorDataLoadingState ){
                x=2;
              }
            },
            builder: (context, state) {
              TdawaCubit tdawaCubit = TdawaCubit.get(context);

              if(x==2){
                return const Center(
                  child: CircularProgressIndicator()
                );
              }
              else if(x==1){
                return Scaffold(
                  appBar: AppBar(
                    elevation: 0,
                    backgroundColor: ColorsManager.primary,
                    toolbarHeight: 110,
                    title:Container(
                        height: 100,
                        child: Image.asset('assets/images/logo.png')),
                    centerTitle: true,
                  ),
                  drawer:  MainDrawer(
                    type: type,
                  ),
                  body:
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child:

                      ListView(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 7,
                              ),
                              Container(
                                height: 120,
                                color: ColorsManager.primary,
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Image.network(
                                    tdawaCubit.doctorModel.doctor_image.toString(),
                                    //fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.10,
                              ),
                              Column(
                                children:  [
                                  Custom_Text(
                                    text:  tdawaCubit.doctorModel.doctor_name.toString(),
                                    alignment: Alignment.center,
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  const Custom_Text(
                                    text: 'نشط',
                                    alignment: Alignment.center,
                                    fontSize: 12,
                                    color: Colors.green,
                                  )
                                ],
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.24,
                              ),
                              SizedBox(
                                height: 50,
                                child: Image.asset(
                                  'assets/images/icon.png',
                                  // fit:BoxFit.cover,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration:BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: ColorsManager.primary,
                            ),

                            child: Card(
                              color: ColorsManager.primary,
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      const SizedBox(
                                        height: 12,
                                      ),

                                      const SizedBox(
                                        height: 5,
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(right:18.0),
                                        child: CustomButton(
                                          text: ' الحجوزات الخاصة بك  ',
                                          color1: Colors.white,
                                          color2: Colors.purple,
                                          onPressed: () {
                                            Get.to(
                                                AppointmentView(listApp: tdawaCubit.listAppointments,
                                                  cubit: tdawaCubit,
                                                ));

                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                   SizedBox(
                                    width:MediaQuery.of(context).size.width*0.2,
                                  ),
                                  Container(
                              height:90,
                                    padding: const EdgeInsets.all(10),
                                    child: Image.asset('assets/images/logo.png'),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const Divider(
                            color: Colors.black,
                            height: 10,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          (tdawaCubit.listAppointments.isNotEmpty)?
                          Row(
                            children: [
                              const SizedBox(
                                width: 12,
                              ),
                              const Custom_Text(
                                text: 'مواعيد تم حجزها ',
                                color: Colors.black,
                                fontSize: 20,
                                alignment: Alignment.topRight,
                              ),
                             SizedBox(
                                width: MediaQuery.of(context).size.width*0.3,
                              ),
                              InkWell(
                                child: const Custom_Text(
                                  text: 'عرض الكل  ',
                                  color: ColorsManager.primary,
                                  fontSize: 18,
                                  alignment: Alignment.topLeft,
                                ),
                                onTap:(){

                                  //  Get.to(const PatientHomeView());
                                  Get.to(AppointmentView(
                                    listApp: tdawaCubit.listAppointments,
                                    cubit: tdawaCubit,
                                  ));
                                },
                              ),
                            ],
                          ):const SizedBox(height:1,),
                          FullAppointmentWidget(tdawaCubit.listAppointments),


                          const SizedBox(height:20,),
                          Row(
                            children: [
                              const Custom_Text(text: 'اشترك vip',fontSize:20,alignment:Alignment.topRight),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.43,
                              ),
                              Container(child:Image.asset('assets/images/gold.png'),)
                            ],
                          ),
                          InkWell(
                            child: Card(
                              child:Center(
                                child: Column(
                                  children: [
                                    const SizedBox(height: 20,),
                                    const Custom_Text(text: 'باقة vip',
                                        fontSize:20,alignment:Alignment.center),

                                    const Custom_Text(text: 'تحصل علي ادارة عيادتك بشكل افضل',
                                        fontSize:20,alignment:Alignment.center),

                                    const Custom_Text(text:'و حقق مكاسب اكثر ',
                                        fontSize:20,alignment:Alignment.center),
                                    const SizedBox(height: 10,),
                                    CustomButton(text: 'اشترك الان',
                                        onPressed:(){
                                          Get.to(const TdawaPlusView());
                                        }, color1:ColorsManager.primary,
                                        color2: Colors.white),
                                    const SizedBox(height: 10,),
                                  ],
                                ),
                              ),
                            ),
                            onTap:(){
                              Get.to(const TdawaPlusView());
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }
              return const Center(
                  child: CircularProgressIndicator()
              );

            }));
  }
}
