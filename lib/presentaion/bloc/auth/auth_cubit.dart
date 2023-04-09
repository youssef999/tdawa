import 'dart:convert';
import 'package:doctors_app/domain/models/user.dart';
import 'package:doctors_app/domain/models/user_model.dart';
import 'package:doctors_app/presentaion/bloc/auth/auth_states.dart';
import 'package:doctors_app/presentaion/const/app_message.dart';
import 'package:doctors_app/presentaion/views/sales/sales_code.dart';
import 'package:doctors_app/presentaion/widgets/Custom_Text.dart';
import 'package:image_picker/image_picker.dart';
import 'package:doctors_app/Data/api_connection/api_connection.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';


 class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() :super(AppIntialState());

  // objects mn nfsy
  static AuthCubit get(context) => BlocProvider.of(context);
  TextEditingController nameController = TextEditingController();
  TextEditingController catController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController place2Controller = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController phoneController1 = TextEditingController();
  TextEditingController phoneController2 = TextEditingController();
  TextEditingController phoneController3 = TextEditingController();
  TextEditingController infoController = TextEditingController();
  TextEditingController masterController = TextEditingController();
  TextEditingController degreeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordCheck = TextEditingController();
  TextEditingController priceController = TextEditingController();

  TextEditingController  addressController = TextEditingController();
  TextEditingController  timeController = TextEditingController();
  TextEditingController  locationController = TextEditingController();
  TextEditingController  days = TextEditingController();


  TextEditingController  addressController2 = TextEditingController();
  TextEditingController  timeController2 = TextEditingController();
  TextEditingController  locationController2 = TextEditingController();

  TextEditingController  addressController3 = TextEditingController();
  TextEditingController  timeController3 = TextEditingController();
  TextEditingController  locationController3 = TextEditingController();
  bool x1=false;
  bool x2=false;


  DoctorModel doctorModel = DoctorModel();
  User user = User();
  var imageLink='';
  final ImagePicker _picker=ImagePicker();
  XFile? pickedImageXFile;


  removeNew(){
    x1=false;
    emit(removeNewSuccess());
  }


  removeNew2(){
    x2=false;
    emit(removeNewSuccess2());
  }



  addNew(){
    x1=true;
    emit(addNewSuccess());
  }

  addNew2(){
    x2=true;
    emit(addNewSuccess2());
  }


  registerAndSaveUserRecord({required String selectedOption}) async {

    final box=GetStorage();
    String country=box.read('country')??'x';

    if(emailController.text.contains('@')==false){

      appMessage(text: 'البريد الاكتروني خاطئ');

    }
   else if(passwordController.text.length<6){
      appMessage(text: 'كلمة السر يجب ان تساوي او تزيد عن  6 احرف');

    }
    else if(catController.text.length<2){
      appMessage(text: 'ادخل التخصص بشكل سليم');
    }
    else if(nameController.text.length<2){
      appMessage(text: 'ادخل الاسم بشكل سليم');

    }
    else if(infoController.text.length<3){

      appMessage(text: 'ادخل معلومات الطبيب  بشكل سليم');
    }
    else if(degreeController.text.length<3){
      appMessage(text: 'ادخل درجة العلمية  بشكل سليم');

    }
    else if(priceController.text.length<1){
      appMessage(text: 'ادخل السعر  بشكل سليم');
    }
    else if(phoneController.text.length<7){
      appMessage(text: 'ادخل رقم هاتفك  بشكل سليم');

    }
    else if(addressController.text.length<2){
      appMessage(text: 'ادخل العنوان  بشكل سليم');

    }
    else if(timeController.text.length<1){
      appMessage(text: 'ادخل التوقيت  بشكل سليم');


    }


    else{
      try {
        emit(RegisterLoadingState());
        var res =
        await http.post(Uri.parse(API.signup), body:
        {
          "doctor_email":emailController.text.trim(),
          "doctor_password":passwordController.text.trim(),
          "doctor_name":nameController.text.trim(),
          "doctor_cat":catController.text.trim(),
          "doctor_info":infoController.text.trim(),
          "doctor_masters":masterController.text.trim(),
          "doctor_degree":degreeController.text.trim(),
          "price":priceController.text.trim(),
          "doctor_phone":phoneController.text.trim(),
          "doctor_phone2":phoneController2.text.trim(),
          "doctor_phone3":phoneController3.text.trim(),
          "doctor_phone1":phoneController1.text.trim(),
          "doctor_image":imageLink,
          'place':placeController.text.trim(),
          'place2':place2Controller.text.trim(),
          'cat2':selectedOption,
          "address1":addressController.text,
          "address2":addressController2.text,
          "address3":addressController3.text,
          "time1":timeController.text,
          "time2":timeController2.text,
          "time3":timeController3.text,
          "location1":locationController.text,
          "location2":locationController2.text,
          "location3":locationController3.text,
           'country':country
        }
        );

        if (res.statusCode == 200) {

          var resOfSignUp = jsonDecode(res.body);

          print(resOfSignUp);
          if (resOfSignUp['Success'] == true) {

            print("SUCCESS");
            emit(RegisterSuccessState());

          } else {
            print(res.body);
            print("error${res.statusCode}");
            emit(RegisterErrorState('not 200'));

          }
        }
      } catch (e) {
        print("ERROR==$e");
        emit(RegisterErrorState(e.toString()));

      }
    }
    }




  login() async {

    emit(LoginLoadingState());


    try {

      var res = await http.post(Uri.parse(API.login), body: {

        'doctor_email': emailController.text.trim(),
        'doctor_password': passwordController.text.trim(),
      });

      print("res${res.body}");

      if (res.statusCode == 200) {
        print("200");

        var resOfLogin = jsonDecode((res.body));

        if (resOfLogin['success'] == true) {
          DoctorModel doc_Info = DoctorModel.fromJson(resOfLogin['userData']);
          print("UserINfo====${doc_Info.doctor_email}");

          final box = GetStorage();

          box.write('doc_email',doc_Info.doctor_email);
          box.write('doc_Id',doc_Info.doctor_id);

          print("SUCCESSS");
          emit(LoginSuccessState());


        }

        else {
          emit(LoginErrorState('not 200'));

        }
      }
      else{
        print(res.statusCode);
      }
    } catch (e) {
      print(e);
      emit(LoginErrorState(e.toString()));

    }
  }

  userRegister() async {
    try {
      emit(UserRegisterLoadingState());
      var res =
      await http.post(Uri.parse(API.userSignup), body:
      {
        "email":emailController.text.trim(),
        "password":passwordController.text.trim(),
        "name":nameController.text.trim(),
        "phone":phoneController.text.trim(),
      }
      );

      if (res.statusCode == 200) {

        var resOfSignUp = jsonDecode(res.body);

        print(resOfSignUp);
        if (resOfSignUp['Success'] == true) {

          emit(UserRegisterSuccessState());

        } else {
          print(res.body);
          print("error${res.statusCode}");
          emit(UserRegisterErrorState('not 200'));

        }
      }
    } catch (e) {
      print("ERROR==$e");
      emit(UserRegisterErrorState(e.toString()));


    }
  }

  userLogin() async {
    if(emailController.text=='sales@gmail.com'&&passwordController.text=='123456'){
      Get.to( SalesCodeView());
    }
    else{
      emit(UserLoginLoadingState());
      try {

        var res = await http.post(Uri.parse(API.userLogin), body: {
          'email': emailController.text.trim(),
          'password': passwordController.text.trim(),
        });

        print("res${res.body}");

        if (res.statusCode == 200) {
          print("200");


          var resOfLogin = jsonDecode((res.body));

          if (resOfLogin['success'] == true) {

            user = User.fromJson(resOfLogin['userData']);

            print("UserINfo====${user.email}");
            final box = GetStorage();
            box.write('email', user.email);
            box.write('userName',user.name);
            box.write('userId', user.id);
            print(user.id);

            print("SUCCESSS");
            // appMessage(text: 'تم تسجيل الدخول بنجاح');


            emit(UserLoginSuccessState());


          }
          else {
            emit(UserLoginErrorState('not 200'));

          }
        }
        else{
          print(res.statusCode);
        }
      } catch (e) {
        print(e);
        emit(UserLoginErrorState(e.toString()));

      }
    }
  }
  showDialogBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            backgroundColor: Colors.white,
            title: const Custom_Text(
              text: 'الصورة ',
              alignment: Alignment.center,
              fontSize: 19,
              color: Colors.black,
            ),
            children: [
              SimpleDialogOption(
                child: const Custom_Text(
                  text: 'كاميرا ',
                  alignment: Alignment.center,
                  fontSize: 14,
                  color: Colors.black,
                ),
                onPressed:(){
                  captureImage();
                },
              ),
              SimpleDialogOption(
                  child: const Custom_Text(
                    text: ' اختر صورة  ',
                    alignment: Alignment.center,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    pickImage();
                  }),
              SimpleDialogOption(
                  child: const Custom_Text(
                    text: 'الغاء  ',
                    alignment: Alignment.center,
                    fontSize: 14,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    Get.back();
                  })
            ],
          );
        });
  }

  captureImage()async{
    pickedImageXFile= await _picker.pickImage(source: ImageSource.camera);
    Get.back();
    pickedImageXFile;

    emit( setImageSuccessState());

    uploadImageToServer();
  }

  pickImage()async{
    pickedImageXFile= await _picker.pickImage(source: ImageSource.gallery);
    Get.back();
    emit( setImageSuccessState());
    uploadImageToServer();
  }

  uploadImageToServer()async {
    emit(sendImageToServerLoadingState());
    try {
      var requestImgurApi = http.MultipartRequest(
          "POST",
          Uri.parse("https://api.imgur.com/3/image")
      );

      String imageName = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();
      requestImgurApi.fields['title'] = imageName;
      requestImgurApi.headers['Authorization'] =
          "Client-ID " + "fb8a505f4086bd5";
      //"6ca0d6456311e4d";

      var imageFile = await http.MultipartFile.fromPath(
        'image',
        pickedImageXFile!.path,
        filename: imageName,
      );

      requestImgurApi.files.add(imageFile);
      var responseFromImgurApi = await requestImgurApi.send();

      var responseDataFromImgurApi = await responseFromImgurApi.stream
          .toBytes();
      var resultFromImgurApi = String.fromCharCodes(responseDataFromImgurApi);

      print("RESULT= = = $resultFromImgurApi");

      Map<String, dynamic> jsonRes = json.decode(resultFromImgurApi);
      imageLink = (jsonRes["data"]["link"]).toString();
      String deleteHash = (jsonRes["data"]["deletehash"]).toString();

      emit(setImageSuccessState());
    } catch (e) {
      print(e);

      emit(sendImageToServerErrorState(error: e.toString()));
    }
  }

}













