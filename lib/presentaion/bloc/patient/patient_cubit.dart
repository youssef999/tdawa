
import 'dart:convert';
import 'package:doctors_app/Data/api_connection/api_connection.dart';
import 'package:doctors_app/domain/models/ads.dart';
import 'package:doctors_app/domain/models/cat.dart';
import 'package:doctors_app/domain/models/fav.dart';
import 'package:doctors_app/domain/models/user.dart';
import 'package:doctors_app/domain/models/user_model.dart';
import 'package:doctors_app/presentaion/bloc/patient/patient_states.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';


class PatientCubit extends Cubit<PatientStates> {
  PatientCubit() :super(AppIntialState());
  TextEditingController email=TextEditingController();
  TextEditingController name=TextEditingController();
  TextEditingController phone=TextEditingController();
  static PatientCubit get(context) => BlocProvider.of(context);
  List<Ads> adsList = [];
  List<DoctorModel> doctorList = [];
  List<DoctorModel> searchList = [];
  List<Cat> catList = [];
  TextEditingController searchController=TextEditingController();

  User user=User();





  Future<List<Ads>> getAllAds() async{

    print("ALL ADS");
    try{
      emit(getAdsLoadingState());
      var res =await http.get(Uri.parse(API.ads),
      );

      if(res.statusCode==200){

        print(res.body);
        var responseBody =jsonDecode(res.body);

        print(responseBody);


        if(responseBody["success"]==true) {
          print(responseBody['Data']);

          (responseBody['Data']as List).forEach ((eachRecord) {

            adsList.add(Ads.fromJson(eachRecord));
          });

          print("Appointment===$adsList");
        }
        emit(getAdsSuccessState());
      }
      else{
        print(res.statusCode);
        emit(getAdsErrorState(error: 'error'));
      }
    }
    catch(e){
      print(e.toString());
      emit(getAdsErrorState(error: e.toString()));
    }

    return adsList;
  }

  Future<List<DoctorModel>> getAllDoctors(String cat2) async{

    print("Doctors");
    try{
      emit(getDoctorsLoadingState());
      var res =await http.post(Uri.parse(API.allDoctorsData),body: {
        'cat2':cat2
      },
      );
      if(res.statusCode==200){
        print(res.body);
        var responseBody =jsonDecode(res.body);
        if(responseBody["success"]==true) {
          print(responseBody['Data']);

          (responseBody['Data']as List).forEach ((eachRecord) {

        doctorList.add(DoctorModel.fromJson(eachRecord));

          });
          print("List===$doctorList");
        }
        emit(getDoctorsSuccessState());
      }
      else{
        print(res.statusCode);
        emit(getDoctorsErrorState());
      }
    }
    catch(e){
      print("Error===");
      print(e.toString());
      emit(getDoctorsErrorState());
    }

    return doctorList;
  }

  Future<List<Cat>> getAllCat() async{

    try{
      emit(getCatLoadingState());
      var res =await http.get(Uri.parse(API.allCat),
      );

      if(res.statusCode==200){
        print(res.bodyBytes);
        var responseBody =jsonDecode(res.body);
        if(responseBody["success"]==true) {
          print(responseBody['Data']);

          (responseBody['Data']as List).forEach ((eachRecord) {

        catList.add(Cat.fromJson(eachRecord));

          });
          print("List===$catList");
        }
        emit(getCatSuccessState());
      }
      else{
        print(res.statusCode);
        emit(getCatErrorState(error: 'error'));
      }
    }
    catch(e){
      print(e.toString());
      emit(getCatErrorState(error:e.toString()));
    }

    return catList;
  }


  Future<User> getUserData() async{

    final box=GetStorage();
    String id=box.read('userId')??'x';
    print('id$id');
    try{
      emit(getUserDataLoadingState());
      var res =await http.post(Uri.parse(API.getUserData),body: {
        'user_id':id
      },
      );

      if(res.statusCode==200){

        print(res.body);
        var responseBody =jsonDecode(res.body);

        if(responseBody["success"]==true) {
          print("Data");
          print(responseBody['Data']);

          user=User.fromJson(responseBody['Data']);

        }
        emit(getUserDataSuccessState());
      }
      else{
        print(res.statusCode);
        emit(getUserDataErrorState(error: 'error'));
      }
    }
    catch(e){
      print(e.toString());
      emit(getUserDataErrorState(error: e.toString()));
    }

    return user;
  }


  Future<List<DoctorModel>> searchData(String name)async {

    emit(SearchLoadingState());
    try{
      var res = await http.post(Uri.parse(API.SEARCH), body: {
        'typedkeyWords':name,
      });

      print("res${res.body}");
      if (res.statusCode == 200) {
        print("......HERE...SEARCH........");

        var resOfFavValidate = jsonDecode((res.body));

        if (resOfFavValidate['success'] == true) {
          (resOfFavValidate['Data'] as List).forEach((eachRecord) {

          searchList.add(DoctorModel.fromJson(eachRecord));

          });
          print("success");
          emit(SearchSuccessState());




        } else {
          print("errrorr");
          emit(SearchErrorState(error: 'e'));

        }
      }
    }catch(e){

      print("ERROR22::$e");
      emit(SearchErrorState(error: e.toString()));

    }
    return searchList;
  }



 void updateData(String emailHint,String nameHint,String phoneHint) async{
    String e,n,p;
    if(email.text==''){
      e=emailHint;
    }else{
      e=email.text;
    }

    if(name.text==''){
      n=nameHint;
    }else{
      n=name.text;
    }
    if(phone.text==''){
      p=phoneHint;
    }else{
      p=phone.text;
    }



  final box=GetStorage();
  String userId=box.read('userId')??'x';
  print("ID===$userId");

    try{
      emit(UpdateDataLoadingState());
      var res =await http.post(Uri.parse(API.updateData),body: {
        'user_id':userId,
        'email':e,
        'name':n,
        'phone':p,
      },
      );

      if(res.statusCode==200){

        var responseBody =jsonDecode(res.body);

        if(responseBody["success"]==true) {
          emit(UpdateDataSuccessState());
        }


      }
      else{
        print(res.statusCode);
        emit(UpdateDataErrorState(error: 'error'));

      }
    }
    catch(e){
      print(e.toString());
      emit(UpdateDataErrorState(error: e.toString()));
    }

  }









}


















