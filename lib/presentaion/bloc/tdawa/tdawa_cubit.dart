import 'dart:convert';
import 'package:doctors_app/Data/api_connection/api_connection.dart';
import 'package:doctors_app/domain/models/ads.dart';
import 'package:doctors_app/domain/models/booking.dart';
import 'package:doctors_app/domain/models/bouquet.dart';
import 'package:doctors_app/domain/models/user.dart';
import 'package:doctors_app/presentaion/bloc/tdawa/tdawa_states.dart';
import 'package:doctors_app/presentaion/const/app_message.dart';
import 'package:doctors_app/presentaion/widgets/Custom_Text.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import '../../../domain/models/moderator.dart';


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
  List<Booking> listAppointments = [];
  List<Baka> bakaList = [];
  List<Mod> modList = [];
  DoctorModel doctorModel=DoctorModel();
  Mod mod=Mod();
  List<Ads> adsList = [];


  TextEditingController adNameController=TextEditingController();
  TextEditingController adDetailsController=TextEditingController();

  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  TextEditingController nameController=TextEditingController();
  TextEditingController codeController=TextEditingController();

  var imageLink='';
  final ImagePicker _picker=ImagePicker();
  XFile ? pickedImageXFile;

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


  void updateData(String id,String nameHint,String detailsHint,String image2) async{
    String e,n,image;
    if(adNameController.text==''){
      e=nameHint;
    }else{
      e=adNameController.text;
    }

    if(adDetailsController.text==''){
      n=detailsHint;
    }else{
      n=adDetailsController.text;
    }

    if(pickedImageXFile==null){
      image=image2;
    }else{
      image=imageLink;
    }
print("IMAGE====="+imageLink);

    if(e.length>2||n.length>3||image.length>2){
      try{
        emit(UpdateDoctorAdsLoadingState());
        var res =await http.post(Uri.parse(API.updateAd),body: {
          'id':id,
          'name':e,
          'details':n,
          'image':image,
        },
        );

        if(res.statusCode==200){

          var responseBody =jsonDecode(res.body);

          if(responseBody["success"]==true) {
            emit(UpdateDoctorAdsSuccessState());
          }


        }
        else{
          print(res.statusCode);
          emit(UpdateDoctorAdsErrorState(error: 'error'));

        }
      }
      catch(e){
        print(e.toString());
        emit(UpdateDoctorAdsErrorState(error: 'error'));
      }
    }else{
      appMessage(text: 'لم تقم باي تعديل');

    }




  }

  void RenewAd
      ({required String id,required String nameHint,required String detailsHint,
    required String image2,required int days}) async{

    DateTime now = DateTime.now();
    DateTime futureDate = now.add( Duration(days:days));
    print(now);
    print(futureDate);

     print('ID$id');
     print('ID$nameHint');

      try{
        emit(RenewDoctorAdsLoadingState());
        var res =await http.post(Uri.parse(API.RenewAd),body: {
          'id':id,
          'name':nameHint,
          'details':detailsHint,
          'image':image2,
          'date_end':futureDate.toString()
        },
        );
        if(res.statusCode==200){

          var responseBody =jsonDecode(res.body);
          if(responseBody["success"]==true) {
            emit(RenewDoctorAdsSuccessState());
          }


        }
        else{
          print(res.statusCode);
          emit(RenewDoctorAdsErrorState(error: 'error'));

        }
      }
      catch(e){
        print(e.toString());
        emit(RenewDoctorAdsErrorState(error: 'error'));
      }





  }


 modLogin() async {

    emit(ModLoginLoadingState());


    try {

      var res = await http.post(Uri.parse(API.ModLogin), body: {

        'name': nameController.text.trim(),
        'code': codeController.text.trim(),
      });

      print("res${res.body}");

      if (res.statusCode == 200) {
        print("200");

        var resOfLogin = jsonDecode((res.body));

        if (resOfLogin['success'] == true) {
    mod = Mod.fromJson(resOfLogin['userData']);
    final box=GetStorage();
    box.write('doc_Id',mod.doctor_id.toString());
    box.write('mod_Id',mod.id.toString());
          print("UserINfo====${mod.doctor_id}");


          print("SUCCESSS");
          emit(ModLoginSuccessState());


        }

        else {
          emit(ModLoginErrorState( error: 'not 200'));

        }
      }
      else{
        print(res.statusCode);
      }
    } catch (e) {
      print(e);
      emit(ModLoginErrorState( error: 'not 200'));

    }
  }

  Future<List<Booking>> getDocotorBoking() async{
    final box=GetStorage();
    String doctorId=box.read('doc_Id')??"x";
    try{
      emit(getAppointmentsLoadingState());
      var res =await http.post(Uri.parse(API.DoctorBookings),
          body: {
            "doctor_id":doctorId,
          }
      );

      if(res.statusCode==200){
        print("APP==200");
        var responseBody =jsonDecode(res.body);

        if(responseBody["success"]==true) {
          print("Bookings");
          print(responseBody['Data']);
          (responseBody['Data']as List).forEach ((eachRecord) {

            listAppointments.add(Booking.fromJson(eachRecord));

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
      print('ERRORR==='+e.toString());
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

  Future<List<Mod>> getAllMod() async{

    try{
      emit(getModLoadingState());
      var res =await http.get(Uri.parse(API.getMod),
      );

      if(res.statusCode==200){
        print(res.body);
        var responseBody =jsonDecode(res.body);
        if(responseBody["success"]==true) {
          print(responseBody['Data']);

          (responseBody['Data']as List).forEach ((eachRecord) {

            modList.add(Mod.fromJson(eachRecord));

          });
          print("MOD===$modList");
        }
        emit(getModSuccessState());
      }
      else{
        emit(getModErrorState(error: 'error'));
      }
    }
    catch(e){
      print('ERRRORRR');
      print(e);
      emit(getModErrorState(error: 'error'));
    }

    return modList;
  }

  addNewMod() async {

    final box=GetStorage();
    String Id=box.read('doc_Id')??'x';
    print("ID"+Id);
    if(nameController.text.length>2&&codeController.text.length>3){
      try {
        emit(AddModLoadingState());
        var res =
        await http.post(Uri.parse(API.addMod), body:
        {
          "name":nameController.text.trim(),
          "code":codeController.text.trim(),
          "doctor_id":Id
        }
        );

        if (res.statusCode == 200) {

          var resOfSignUp = jsonDecode(res.body);

          print(resOfSignUp);
          if (resOfSignUp['Success'] == true) {

            emit(AddModSuccessState());

          } else {
            print(res.body);
            print("error${res.statusCode}");
            emit(AddModErrorState( error: 'not 200'));

          }
        }
      } catch (e) {
        print("ERROR==$e");
        emit(AddModErrorState( error: 'not 200'));


      }
    }else{

      appMessage(text: 'ادخل البيانات بشكل سليم');

    }

  }

  deleteMod(String id) async {

    emit(DeleteModLoadingState());
      try {

        var res =
        await http.post(Uri.parse(API.deleteMod), body:
        {
          "id":id,
        }
        );

        if (res.statusCode == 200) {

          print('HERE');
          var resOfSignUp = jsonDecode(res.body);

          print(resOfSignUp);
          if (resOfSignUp['Success'] == true) {

            emit(DeleteModSuccessState());

          } else {
            print(res.body);
            print("error${res.statusCode}");
            emit(DeleteModErrorState( error: 'not 200'));

          }
        }
      } catch (e) {
        print("ERROR==$e");
        emit(DeleteModErrorState( error: 'not 200'));
      }


  }


  Future<DoctorModel> getDoctorData() async{

    final box=GetStorage();
    String id=box.read('doc_Id')??'x';
    print('id$id');
    try{
      emit(getDoctorDataLoadingState());
      var res =await http.post(Uri.parse(API.getDoctorData),body: {
        'doctor_id':id
      },
      );

      if(res.statusCode==200){

        print(res.body);
        var responseBody =jsonDecode(res.body);

        if(responseBody["success"]==true) {
          print("Data");
          print(responseBody['Data']);

          doctorModel=DoctorModel.fromJson(responseBody['Data']);

        }
        emit(getDoctorDataSuccessState());
      }
      else{
        print(res.statusCode);
        emit(getDoctorDataErrorState(error: 'error'));
      }
    }
    catch(e){
      print(e.toString());
      emit(getDoctorDataErrorState(error: e.toString()));
    }

    return doctorModel;
  }

  Future<List<Ads>> getDoctorAds() async{

    final box=GetStorage();
    String id=box.read('doc_Id')??'x';
    print('id$id');
    try{
      emit(getDoctorAdsLoadingState());
      var res =await http.post(Uri.parse(API.getDoctorAds),body: {
        'doctor_id':id
      },
      );

      if(res.statusCode==200){

        print(res.body);
        var responseBody =jsonDecode(res.body);

        if(responseBody["success"]==true) {
          print("Data");
          print(responseBody['Data']);

          (responseBody['Data']as List).forEach ((eachRecord) {

            adsList.add(Ads.fromJson(eachRecord));

          });

        }
        emit(getDoctorAdsSuccessState());
      }
      else{
        print(res.statusCode);
        emit(getDoctorAdsErrorState(error: 'error'));
      }
    }
    catch(e){
      print(e.toString());
      emit(getDoctorAdsErrorState(error: e.toString()));
    }

    return adsList;
  }


  addNewAd(int days) async {
    print("days-==-=$days");
    DateTime now = DateTime.now();
    DateTime futureDate = now.add( Duration(days:days));
    print(now);
    print(futureDate);
    final box=GetStorage();
    String doctorId=box.read('doc_Id')??'x';
    String country=box.read('country')??'x';
    print("ID=======$doctorId");

    if(adNameController.text.length>2&&adDetailsController.text.length>3&& imageLink.length>2)
    {
      try {

        emit(addNewAdLoadingState());
        var res =
        await http.post(Uri.parse(API.adAds), body:
        {
          'doctor_id':doctorId,
          'name':adNameController.text,
          'details':adDetailsController.text,
          'image':imageLink,
          'country':country,
          'date_end':futureDate.toString()
        }
        );

        if (res.statusCode == 200) {

          var resOfSignUp = jsonDecode(res.body);

          print(resOfSignUp);
          if (resOfSignUp['success'] == true) {

            print("SUCCESS");
            emit(addNewAdSuccessState());

          } else {
            print(res.body);
            print("error${res.statusCode}");
            emit(addNewAdErrorState(error: 'not 200'));

          }
        }
      } catch (e) {
        print("ERROR==$e");
        emit(addNewAdErrorState(error: 'not 200'));

      }
    }

     if(adNameController.text.length<2){


       appMessage(text: 'ادخل اسم الاعلان بشكل سليم');

    }

    if(adDetailsController.text.length<2){

      appMessage(text: 'ادخل تفاصيل الاعلان بشكل سليم');

     }

    if(imageLink.length<2){

      appMessage(text: 'صورة الاعلان مطلوبة');

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


    } catch (e) {
      print(e);


    }
  }

}













