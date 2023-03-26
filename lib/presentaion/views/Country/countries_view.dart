
import 'package:doctors_app/domain/models/country.dart';
import 'package:doctors_app/presentaion/bloc/country/country_bloc.dart';
import 'package:doctors_app/presentaion/bloc/country/country_states.dart';
import 'package:doctors_app/presentaion/resources/color_manager.dart';
import 'package:doctors_app/presentaion/views/HomeApp/choose/choose_view.dart';
import 'package:doctors_app/presentaion/widgets/Custom_Text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CountriesView extends StatelessWidget {
  const CountriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create:(BuildContext context)=>CountryCubit()..getAllCountries(),
        child: BlocConsumer<CountryCubit,CountryStates>(
        listener:(context,state){

    },
    builder:(context,state){

    CountryCubit cubit = CountryCubit.get(context);
    return Scaffold(
      appBar:AppBar(
        toolbarHeight: 7,
        elevation: 0,
        backgroundColor:ColorsManager.primary,
      ),
       body: Container(
         color:ColorsManager.primary,
         child: ListView(
           children: [
             const SizedBox(height: 10,),
             Container(
               color:ColorsManager.primary,
               height: 150,
               child:Image.asset('assets/images/logo.png'),
             ),
             const SizedBox(height: 20,),
             const Custom_Text(text: 'اختر البلد',fontSize: 28,color:Colors.white,alignment:Alignment.center),
             const SizedBox(height: 20,),
             CountryWidget(cubit.countryList,cubit),
           ],
         ),
       )
    );
    }

        )
    );
  }
}

 Widget CountryWidget(List<Country> listApp,CountryCubit cubit) {



   return SingleChildScrollView(
     child: Container(
       height:2100,
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
                   height: 80,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(15),
                       color: Colors.white70),
                   child:   Custom_Text(
                     text: listApp[index].name.toString(),
                     color: ColorsManager.black,
                     fontSize: 21,
                     alignment: Alignment.center,
                   ),


                 ),
                 onTap: () {
                   print(listApp[index].name.toString());
                   final box=GetStorage();
                   box.write('country',listApp[index].name);
                   Get.to(const ChooseView());
                 },
               ),
             );
           }),
     ),
   );
 }