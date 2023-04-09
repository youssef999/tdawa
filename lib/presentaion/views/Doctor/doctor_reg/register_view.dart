import 'dart:io';
import 'package:doctors_app/presentaion/bloc/auth/auth_cubit.dart';
import 'package:doctors_app/presentaion/bloc/auth/auth_states.dart';
import 'package:doctors_app/presentaion/const/app_message.dart';
import 'package:doctors_app/presentaion/resources/color_manager.dart';
import 'package:doctors_app/presentaion/widgets/Custom_Text.dart';
import 'package:doctors_app/presentaion/widgets/Custom_button.dart';
import 'package:doctors_app/presentaion/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../User/user_auth/user_login_view.dart';



class RegisterView extends StatefulWidget {
  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
//   RegisterView({Key? key}) : super(key: key);
  List<String> _options = ['طبيب', 'مستشفي', 'صيدلية','علاج نفسي','مركز تجميل','مركز اشاعة'
    ,'مركز تحاليل','اخري'];

  String selectedOption='طبيب';

  Widget _buildRadioList() {
    return Column(
      children: _options
          .map(
            (option) => RadioListTile(
          title: Text(option),
          value: option,
          groupValue: selectedOption,
          onChanged: (value) {
            setState(() {
              selectedOption = value.toString();
            });
          },
        ),
      )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        create: (BuildContext context) => AuthCubit(),
        child: BlocConsumer<AuthCubit, AuthStates>(
            listener: (context, state) {

              if(state is RegisterSuccessState){

                appMessage(text: 'تم انشاء حسابك بنجاح');

              Get.offAll(UserLoginView(
                  cat: 'doctor',
                ));
              }

              if(state is RegisterErrorState){

                appMessage(text: 'حدث خطا ربما ادخلت بيانات بشكل خاطئ');


              }
            },
            builder: (context, state) {
              AuthCubit authCubit = AuthCubit.get(context);
              return Scaffold(
                backgroundColor:ColorsManager.white,
                appBar: AppBar(
                  elevation: 0,

                  backgroundColor: ColorsManager.primary,
                  toolbarHeight: 1,
                ),
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Padding(
                        padding: const EdgeInsets.only(left:8.0,right:8),
                        child: Column(
                          children:  [
                            const SizedBox(height: 20,),
                            Image.asset('assets/images/logo2.png'),
                            const SizedBox(height: 10,),
                            const Custom_Text(text: ' بيانات الطبيب',
                              fontSize:24,
                              alignment:Alignment.center,
                              color:Colors.black,
                            ),

                            _buildRadioList(),

                            const SizedBox(height: 20,),
                            authCubit.pickedImageXFile != null?
                             InkWell(
                              child: Container(
                                height:  MediaQuery.of(context).size.width*0.6,
                                width: MediaQuery.of(context).size.width*0.8,
                                decoration:BoxDecoration(
                                    image: DecorationImage(
                                        image:FileImage(
                                            File(authCubit.pickedImageXFile!.path)),
                                        fit:BoxFit.fill
                                    )
                                ),
                              ),
                              onTap:(){
                                authCubit.showDialogBox(context);
                              },
                            ):InkWell(
                              child: Column(
                                children: [

                                  CircleAvatar(
                                    radius: 100,
                                    child:Image.asset('assets/images/doc2.png'),
                                  ),
                                  const SizedBox(height: 10,),
                                  const Custom_Text(text: 'اضف صورتك',color:Colors.black,
                                    fontSize:21,alignment:Alignment.center,
                                  ),
                                ],
                              ),
                              onTap:(){
                                authCubit.showDialogBox(context);
                              },
                            ),
                            const SizedBox(height: 20,),
                            CustomTextFormField(
                              controller:authCubit.nameController,
                              color:Colors.black,
                              hint: "الاسم بالكامل",
                              max: 2,
                              obs: false,
                              obx: false,
                              ontap:(){},
                              type:TextInputType.text,
                            ),
                            const SizedBox(height: 10,),
                            CustomTextFormField(
                              controller:authCubit.emailController,
                              color:Colors.black,
                              hint: "البريد الالكتروني ",
                              max: 2,
                              obs: false,
                              obx: false,
                              ontap:(){},
                              type:TextInputType.text,
                            ),
                            const SizedBox(height: 10,),
                            CustomTextFormField(
                              controller:authCubit.phoneController,
                              color:Colors.black,
                              hint: "رقم الهاتف",
                              obs: false,
                              obx: false,
                              ontap:(){},
                              type:TextInputType.phone,
                            ),
                            const SizedBox(height: 10,),
                            CustomTextFormField(
                              controller:authCubit.catController,
                              color:Colors.black,
                              hint: "  التخصص ",
                              obs: false,
                              max:2,
                              obx: false,
                              ontap:(){},
                              type:TextInputType.text,
                            ),
                            const SizedBox(height: 10,),
                            CustomTextFormField(
                              controller:authCubit.placeController,
                              color:Colors.black,
                              hint: " المدينة ",
                              obs: false,
                              max:2,
                              obx: false,
                              ontap:(){},
                              type:TextInputType.text,
                            ),
                            const SizedBox(height: 10,),
                            CustomTextFormField(
                              controller:authCubit.place2Controller,
                              color:Colors.black,
                              hint: " المنطقة مثل : مدينة نصر او الهرم ...  ",
                              obs: false,
                              max:2,
                              obx: false,
                              ontap:(){},
                              type:TextInputType.text,
                            ),
                            const SizedBox(height: 10,),
                            CustomTextFormField(
                              controller:authCubit.infoController,
                              color:Colors.black,
                              hint: "معلومات و تفاصيل ",
                              obs: false,
                              max:6,
                              obx: false,
                              ontap:(){},
                              type:TextInputType.text,
                            ),
                            const SizedBox(height: 10,),
                            const SizedBox(height: 10,),
                            const Custom_Text(text: 'ايام العمل تضاف بهذا الشكل مثلا سبت , احد , ثلاثاء',
                            alignment:Alignment.center,
                              color:Colors.red,
                              fontSize: 15,
                            ),
                            const SizedBox(height: 10,),
                            CustomTextFormField(
                              controller:authCubit.days,
                              color:Colors.black,
                              hint: " ايام العمل    ",
                              max:3,
                              obs: false,
                              obx: false,
                              ontap:(){},
                              type:TextInputType.text,
                            ),
                            const SizedBox(height: 10,),
                            CustomTextFormField(
                              controller:authCubit.priceController,
                              color:Colors.black,
                              hint: " سعر الكشف    ",
                              max:2,
                              obs: false,
                              obx: false,
                              ontap:(){},
                              type:TextInputType.text,
                            ),
                            CustomTextFormField(
                              controller:authCubit.degreeController,
                              color:Colors.black,
                              hint: "الدرجة العلمية ",
                              obs: false,
                              max:3,
                              obx: false,
                              ontap:(){},
                              type:TextInputType.text,
                            ),
                            const SizedBox(height: 10,),

                            CustomTextFormField(
                              controller:authCubit.passwordController,
                              color:Colors.black,
                              hint: "كلمة المرور ",
                              obs: true,
                              obx: true,
                              ontap:(){},
                              type:TextInputType.text,
                            ),


                            // بيانات العيادة

                            const SizedBox(height: 30,),
                            const Custom_Text(text: 'بيانات خاصة بعملك',
                            color:Colors.black,
                              fontSize:23,
                              alignment:Alignment.center,
                            ),

                            const SizedBox(height: 10,),
                            Column(
                              children: [
                                CustomTextFormField(
                                  controller:authCubit.addressController,
                                  color:Colors.black,
                                  hint: " العنوان   ",
                                  max:2,
                                  obs: false,
                                  obx: false,
                                  ontap:(){},
                                  type:TextInputType.text,
                                ),
                                CustomTextFormField(
                                  controller:authCubit.phoneController1,
                                  color:Colors.black,
                                  hint: "رقم الهاتف",
                                  obs: false,
                                  obx: false,
                                  ontap:(){},
                                  type:TextInputType.phone,
                                ),
                                const SizedBox(height: 10,),
                                CustomTextFormField(
                                  controller:authCubit.timeController,
                                  color:Colors.black,
                                  hint: " ميعاد العمل    ",
                                  max:2,
                                  obs: false,
                                  obx: false,
                                  ontap:(){},
                                  type:TextInputType.text,
                                ),
                                const SizedBox(height: 10,),
                                CustomTextFormField(
                                  controller:authCubit.locationController,
                                  color:Colors.black,
                                  hint: " رابط الموقع علي الخريطة   ",
                                  max:2,
                                  obs: false,
                                  obx: false,
                                  ontap:(){},
                                  type:TextInputType.text,
                                ),

                              ],
                            ),
                            (authCubit.x1==false)?
                            InkWell(child:
                            Column(
                              children: [
                                Icon(Icons.add,color:ColorsManager.primary,size:30,),
                                Custom_Text(text: 'اضافة مكان عمل ',
                                color:Colors.black, alignment:Alignment.center,
                                )
                              ],
                            ),
                            onTap:(){
                              authCubit.addNew();
                            },
                            ):  InkWell(child:
                           Icon(Icons.minimize,color:ColorsManager.primary,size:30,),
                              onTap:(){
                                authCubit.removeNew();
                              },
                            ),
                            const SizedBox(height: 10,),

                             // العيادة 2
                            (authCubit.x1==true)?
                            Column(
                              children: [
                                CustomTextFormField(
                                  controller:authCubit.addressController2,
                                  color:Colors.black,
                                  hint: " العنوان   ",
                                  max:2,
                                  obs: false,
                                  obx: false,
                                  ontap:(){},
                                  type:TextInputType.text,
                                ),
                                CustomTextFormField(
                                  controller:authCubit.phoneController2,
                                  color:Colors.black,
                                  hint: "رقم الهاتف",
                                  obs: false,
                                  obx: false,
                                  ontap:(){},
                                  type:TextInputType.phone,
                                ),
                                const SizedBox(height: 10,),
                                CustomTextFormField(
                                  controller:authCubit.timeController2,
                                  color:Colors.black,
                                  hint: " ميعاد العمل    ",
                                  max:2,
                                  obs: false,
                                  obx: false,
                                  ontap:(){},
                                  type:TextInputType.text,
                                ),

                                const SizedBox(height: 10,),
                                CustomTextFormField(
                                  controller:authCubit.locationController2,
                                  color:Colors.black,
                                  hint: " رابط الموقع علي الخريطة   ",
                                  max:2,
                                  obs: false,
                                  obx: false,
                                  ontap:(){},
                                  type:TextInputType.text,
                                ),
                              ],
                            ):const SizedBox(height: 10,),


                            (authCubit.x2==false)?
                            InkWell(child:
                            Column(
                              children:  [
                                Icon(Icons.add,color:ColorsManager.primary,size:30,),
                                Custom_Text(text: 'اضافة مكان عمل ',
                                  color:Colors.black, alignment:Alignment.center,
                                )
                              ],
                            ),
                              onTap:(){
                                authCubit.addNew2();
                              },
                            ):  InkWell(child:
                             Icon(Icons.minimize,color:ColorsManager.primary,size:30,),
                              onTap:(){
                                authCubit.removeNew2();
                              },
                            ),

                            // عيادة 3
                            (authCubit.x2==true)?
                            Column(
                              children: [
                                CustomTextFormField(
                                  controller:authCubit.addressController3,
                                  color:Colors.black,
                                  hint: " العنوان   ",
                                  max:2,
                                  obs: false,
                                  obx: false,
                                  ontap:(){},
                                  type:TextInputType.text,
                                ),
                                CustomTextFormField(
                                  controller:authCubit.phoneController3,
                                  color:Colors.black,
                                  hint: "رقم الهاتف",
                                  obs: false,
                                  obx: false,
                                  ontap:(){},
                                  type:TextInputType.phone,
                                ),
                                const SizedBox(height: 10,),
                                CustomTextFormField(
                                  controller:authCubit.timeController3,
                                  color:Colors.black,
                                  hint: " ميعاد العمل    ",
                                  max:2,
                                  obs: false,
                                  obx: false,
                                  ontap:(){},
                                  type:TextInputType.text,
                                ),
                                const SizedBox(height: 10,),
                                CustomTextFormField(
                                  controller:authCubit.locationController3,
                                  color:Colors.black,
                                  hint: " رابط الموقع علي الخريطة   ",
                                  max:2,
                                  obs: false,
                                  obx: false,
                                  ontap:(){},
                                  type:TextInputType.text,
                                ),
                              ],
                            ):const SizedBox(height: 10,),


                            const SizedBox(height: 20,),
                            CustomButton(text: "تسجيل",
                                onPressed: (){
                                  authCubit.registerAndSaveUserRecord(selectedOption: selectedOption);
                                }, color1:ColorsManager.primary,
                                color2: Colors.white),
                            const SizedBox(height: 30,),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
