
import 'dart:convert';
import 'package:doctors_app/Data/api_connection/api_connection.dart';
import 'package:doctors_app/domain/models/bouquet.dart';
import 'package:doctors_app/presentaion/bloc/tdawa/tdawa_states.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

import '../../../domain/models/ap.dart';


class TdawaCubit extends Cubit<TdawaStates> {
  TdawaCubit() :super(AppIntialState());

  static TdawaCubit get(context) => BlocProvider.of(context);
  String x='';
  bool p1=true;
  bool p2=false;
  bool p3=false;
  Color cardColor=Colors.grey;
  Color cardColor2=Colors.white;
  Color cardColor3=Colors.white;
  List<Appointment> listAppointments = [];
  List<Baka> bakaList = [];

  dispalyFirst(){
   p1=true;
   p2=false;
   p3=false;
   cardColor=Colors.grey;
   cardColor2=Colors.white;
   cardColor3=Colors.white;
   emit(displayFirstSuccessState());
 }
  dispalySecond(){
    p2=true;
    p3=false;
    cardColor2=Colors.grey;
    cardColor=Colors.white;
    cardColor3=Colors.white;
    p1=false;
    emit(displaySecondSuccessState());
  }
  dispalyThird(){
    p3=true;
    p2=false;
    cardColor3=Colors.grey;
    cardColor2=Colors.white;
    cardColor=Colors.white;
    p1=false;
    emit(displayThirdSuccessState());
  }

  Future<List<Appointment>> getDocotorAppointments() async{

    try{
      emit(getAppointmentsLoadingState());
      var res =await http.post(Uri.parse(API.appointments),
      body: {
        "doctor_name":'test',
      }
      );

      if(res.statusCode==200){
        var responseBody =jsonDecode(res.body);

        if(responseBody["success"]==true) {
          print(responseBody['Data']);
          (responseBody['Data']as List).forEach ((eachRecord) {

            listAppointments.add(Appointment.fromJson(eachRecord));

          });
          print("Appointment===$listAppointments");
        }
        emit(getAppointmentsSuccessState());
      }
      else{
        emit(getAppointmentsErrorState(error: 'error'));
      }
    }
    catch(e){
      emit(getAppointmentsErrorState(error: e.toString()));
    }

    return listAppointments;
  }


  Future<List<Baka>> getAllBouquet() async{

    try{
      emit(getBakaLoadingState());
      var res =await http.get(Uri.parse(API.bouquet),
      );

      if(res.statusCode==200){
        print(res.bodyBytes);
        var responseBody =jsonDecode(res.body);
        if(responseBody["success"]==true) {
          print(responseBody['Data']);

          (responseBody['Data']as List).forEach ((eachRecord) {

           bakaList.add(Baka.fromJson(eachRecord));

          });
          print("Appointment===$listAppointments");
        }
        emit(getBakaSuccessState());
      }
      else{
        emit(getAppointmentsErrorState(error: 'error'));
      }
    }
    catch(e){
      emit(getAppointmentsErrorState(error: e.toString()));
    }

   return bakaList;
  }

}













