
import 'package:doctors_app/presentaion/resources/color_manager.dart';
import 'package:doctors_app/presentaion/views/Country/countries_view.dart';
import 'package:doctors_app/presentaion/widgets/Custom_Text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../views/Doctor/moderator/mod_view.dart';


 class MainDrawer extends StatefulWidget {
 String type;


 MainDrawer({required this.type});

  @override
  _MainDrawerState createState() => _MainDrawerState();

 }

class _MainDrawerState extends State<MainDrawer> {

  bool show=false;


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(widget.type=='doctor'){
      return Drawer(
          backgroundColor: Colors.white,
          child: SafeArea(
              child: SingleChildScrollView(
                  child: Column(
                      children: <Widget>[

                        Container(
                          height: 20,
                          color: ColorsManager.primary,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          child: Row(
                            children: const [
                              SizedBox(width: 30,),
                              Icon(Icons.logout,color:Colors.red,size:30,),
                              SizedBox(width: 30,),
                              Custom_Text(
                                text:'مديرين حسابك ',
                                fontSize:21,
                              )
                            ],
                          ),
                          onTap:(){
                        Get.to(ModView());
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),

                        InkWell(
                          child: Row(
                            children: const [
                              SizedBox(width: 30,),
                              Icon(Icons.logout,color:Colors.red,size:30,),
                              SizedBox(width: 30,),
                              Custom_Text(
                                text: 'تسجيل خروج',
                                fontSize:21,
                              )
                            ],
                          ),
                          onTap:(){
                            final box=GetStorage();
                            box.remove('doc_Id');
                            Get.off(const CountriesView());
                          },
                        )


                      ]))));
    }else{
      return Drawer(
          backgroundColor: Colors.white,
          child: SafeArea(
              child: SingleChildScrollView(
                  child: Column(
                      children: <Widget>[

                        Container(
                          height: 20,
                          color: ColorsManager.primary,
                        ),

                        const SizedBox(
                          height: 30,
                        ),

                        InkWell(
                          child: Row(
                            children: const [
                              SizedBox(width: 30,),
                              Icon(Icons.logout,color:Colors.red,size:30,),
                              SizedBox(width: 30,),
                              Custom_Text(
                                text: 'تسجيل خروج',
                                fontSize:21,
                              )
                            ],
                          ),
                          onTap:(){
                            final box=GetStorage();
                            box.remove('userId');
                            box.remove('doc_Id');
                            box.remove('mod_Id');
                            Get.offAll(const CountriesView());
                          },
                        )


                      ]))));
    }

  }



}






