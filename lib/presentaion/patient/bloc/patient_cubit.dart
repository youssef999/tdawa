
import 'dart:convert';
import 'package:doctors_app/Data/api_connection/api_connection.dart';
import 'package:doctors_app/domain/models/ads.dart';
import 'package:doctors_app/presentaion/patient/bloc/patient_states.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';


class PatientCubit extends Cubit<PatientStates> {
  PatientCubit() :super(AppIntialState());

  static PatientCubit get(context) => BlocProvider.of(context);
  List<Ads> adsList = [];


  Future<List<Ads>> getAllAds() async{

    try{
      emit(getAdsLoadingState());
      var res =await http.get(Uri.parse(API.ads),
      );

      if(res.statusCode==200){
        print(res.bodyBytes);
        var responseBody =jsonDecode(res.body);
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



}













