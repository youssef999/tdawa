
import 'dart:convert';
import 'package:doctors_app/domain/models/user.dart';
import 'package:doctors_app/domain/models/user_model.dart';
import 'package:doctors_app/presentaion/bloc/auth/auth_states.dart';
import 'package:doctors_app/presentaion/widgets/Custom_Text.dart';
import 'package:image_picker/image_picker.dart';
import 'package:doctors_app/Data/api_connection/api_connection.dart';
import 'package:doctors_app/presentaion/resources/color_manager.dart';
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
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController infoController = TextEditingController();
  TextEditingController masterController = TextEditingController();
  TextEditingController degreeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordCheck = TextEditingController();

  TextEditingController  addressController = TextEditingController();
  TextEditingController  timeController = TextEditingController();
  TextEditingController  locationController = TextEditingController();


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


  // void validateUserEmail() async {
  //   try {
  //     var res = await http.post(Uri.parse(API.validateEmail),
  //         body: {'user_email': emailController.text.trim()});
  //
  //     print("res==${res.body}");
  //
  //     if (res.statusCode == 200) {
  //       var resBodyofValidateEmail = jsonDecode((res.body));
  //       if (resBodyofValidateEmail['emailFound']) {
  //         Get.snackbar('', 'Done', backgroundColor: ColorsManager.primary2,
  //             colorText: Colors.white);
  //       } else {
  //         print("here");
  //         registerAndSaveUserRecord();
  //       }
  //     }
  //   } catch (e) {
  //     print("ERRORxxx::$e");
  //     Get.snackbar('', 'Error', backgroundColor: ColorsManager.primary2,
  //         colorText: Colors.white);
  //   }
  // }

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


  registerAndSaveUserRecord() async {
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
        "doctor_phone":phoneController.text.trim(),
        "doctor_image":imageLink,
        "address1":addressController.text,
        "address2":addressController2.text,
        "address3":addressController3.text,
        "time1":timeController.text,
        "time2":timeController2.text,
        "time3":timeController3.text,
        "location1":locationController.text,
        "location2":locationController2.text,
        "location3":locationController3.text,
      }
      );

      if (res.statusCode == 200) {
        emit(RegisterSuccessState());
        var resOfSignUp = jsonDecode(res.body);

        print(resOfSignUp);
        if (resOfSignUp['Success'] == true) {

          print("SUCCESS");


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


        emit(LoginSuccessState());

        var resOfLogin = jsonDecode((res.body));

        if (resOfLogin['success'] == true) {
          DoctorModel doc_Info = DoctorModel.fromJson(resOfLogin['userData']);
          print("UserINfo====${doc_Info.doctor_email}");

          final box = GetStorage();

          box.write('doc_email',doc_Info.doctor_email);
          box.write('doc_Id',doc_Info.doctor_id);

          print("SUCCESSS");
          Get.snackbar(
              '', 'Login DONE ', backgroundColor: ColorsManager.primary2,
              colorText: Colors.white);

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


          Get.snackbar(
              '', ' تم تسجيل الدخول بنجاح  ', backgroundColor: ColorsManager.primary2,
              colorText: Colors.white);

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













