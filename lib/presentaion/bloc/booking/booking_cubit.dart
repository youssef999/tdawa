
import 'dart:convert';
import 'package:doctors_app/domain/models/booking.dart';
import 'package:doctors_app/domain/models/user.dart';
import 'package:doctors_app/presentaion/widgets/Custom_Text.dart';
import 'package:image_picker/image_picker.dart';
import 'package:doctors_app/Data/api_connection/api_connection.dart';
import 'package:doctors_app/presentaion/resources/color_manager.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

import 'booking_states.dart';


class BookingCubit extends Cubit<BookingStates> {
  BookingCubit() :super(AppIntialState());

  // objects mn nfsy
  static  BookingCubit get(context) => BlocProvider.of(context);
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dataController = TextEditingController();
  TextEditingController dayController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  List<Booking> bookingList=[];

  addNewBooking(String doctorId,String day) async {

    final box=GetStorage();
    String userId=box.read('userId')??'x';
    DateTime now = DateTime.now();

    emit(AddBookingLoadingState());
    try {

      var res = await http.post(Uri.parse(API.addBooking), body: {

        'name':nameController.text,
        'phone':phoneController.text,
        'data': dataController.text,
        'day':day,
        'age': ageController.text,
        'time':dayController.text,
         'date':now.toString(),
        'user_id':userId,
        'doctor_id':doctorId
      });

      print("res${res.body}");

      if (res.statusCode == 200) {
        print("200");

        var resOfLogin = jsonDecode((res.body));

        if (resOfLogin['success'] == true) {
          emit(AddBookingSuccessState());
          // Booking doc_Info =  Booking.fromJson(resOfLogin['userData']);


          print("SUCCESSS");
          Get.snackbar('', 'تم ارسال طلبك بنجاح   ', backgroundColor: ColorsManager.primary2,
              colorText: Colors.white);
          //      Get.off(DashBoardFragment());

        }

        else {
          emit(AddBookingErrorState('not 200'));
          Get.snackbar('', 'حدث خطا حاول مرة اخري  ',
              backgroundColor: ColorsManager.primary2, colorText: Colors.white);
        }
      }
      else{
        print(res.statusCode);
      }
    } catch (e) {
      print(e);
      emit(AddBookingErrorState(e.toString()));

      Get.snackbar(
          '', 'حدث خطا  ', backgroundColor: ColorsManager.primary2,
          colorText: Colors.white);
    }
  }

  Future <List<Booking>> getUserBooking()async {

    final box=GetStorage();
    String userId=box.read('userId')??'x';
    emit(getBookingLoadingState());
    try{
      var res = await http.post(Uri.parse(API.getBooking),
          body: {
            'user_id': userId
          }
      );

      if (res.statusCode == 200) {

        print("API222");
        print("res======${res.body}");
        var responseBody = jsonDecode(res.body);
        if (responseBody["success"] == true) {
          (responseBody['Data'] as List).forEach((eachRecord) {

        bookingList.add(Booking.fromJson(eachRecord));

            print("book==${bookingList[0].name}");
          });
        }
        emit(getBookingSuccessState());
      }
      else {
        print("eeee");
        emit(getBookingErrorState('error'));
      }

    }
    catch(e){
      print("CART ERROR == $e");
      emit(getBookingErrorState('$e'));

    }
    return bookingList;
  }

 }













