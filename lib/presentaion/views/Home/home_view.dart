
import 'package:doctors_app/presentaion/bloc/tdawa/tdawa_cubit.dart';
import 'package:doctors_app/presentaion/bloc/tdawa/tdawa_states.dart';
import 'package:doctors_app/presentaion/resources/color_manager.dart';
import 'package:doctors_app/presentaion/views/Home/tdawa_plus_view.dart';
import 'package:doctors_app/presentaion/widgets/Custom_Text.dart';
import 'package:doctors_app/presentaion/widgets/Custom_button.dart';
import 'package:doctors_app/presentaion/widgets/appointments/appountments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'appointment_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => TdawaCubit()..getDocotorAppointments(),
        child: BlocConsumer<TdawaCubit, TdawaStates>(
            listener: (context, state) {},
            builder: (context, state) {
              TdawaCubit tdawaCubit = TdawaCubit.get(context);

              return Scaffold(
                  appBar: AppBar(
                    backgroundColor: ColorsManager.primary,
                    toolbarHeight: 5,
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
                                width: 10,
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Image.asset(
                                  'assets/images/doc.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Column(
                                children: const [
                                  Custom_Text(
                                    text: 'name',
                                    alignment: Alignment.center,
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Custom_Text(
                                    text: 'Avaliable',
                                    alignment: Alignment.center,
                                    fontSize: 12,
                                    color: Colors.green,
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 190,
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
                                      const Custom_Text(
                                        text: 'خصم 25 %',
                                        fontSize: 19,
                                        color: Colors.white,
                                        alignment: Alignment.center,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      CustomButton(
                                        text: 'اعلان جديد ',
                                        color1: Colors.white,
                                        color2: Colors.purple,
                                        onPressed: () {
                                          Get.to(const TdawaPlusView());
                                        },
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 100,
                                  ),
                                  Container(
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
                          Row(
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              const Custom_Text(
                                text: 'مواعيد تم حجزها ',
                                color: Colors.black,
                                 fontSize: 20,
                                alignment: Alignment.topRight,
                              ),
                              const SizedBox(
                                width: 170,
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
                                 ));
                                },
                              ),
                            ],
                          ),
                          FullAppointmentWidget(tdawaCubit.listAppointments),
                          SizedBox(height:20,),
                          Row(
                            children: [
                              Custom_Text(text: 'اشترك vip',fontSize:20,alignment:Alignment.topRight),
                              SizedBox(width:MediaQuery.of(context).size.width*0.57,),
                              Container(child:Image.asset('assets/images/gold.png'),)
                            ],
                          ),
                          InkWell(
                            child: Card(
                              child:Center(
                                child: Column(
                                  children: [
                                    SizedBox(height: 20,),
                                    Custom_Text(text: 'باقة vip',
                                        fontSize:20,alignment:Alignment.center),

                                    Custom_Text(text: 'تحصل علي ادارة عيادتك بشكل افضل',
                                        fontSize:20,alignment:Alignment.center),

                                    Custom_Text(text:'و حقق مكاسب اكثر ',
                                        fontSize:20,alignment:Alignment.center),
                                    SizedBox(height: 10,),
                                    CustomButton(text: 'اشترك الان',
                                        onPressed:(){
                                          Get.to(const TdawaPlusView());
                                        }, color1:ColorsManager.primary,
                                        color2: Colors.white),
                                    SizedBox(height: 10,),
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
            }));
  }
}
