

abstract class TdawaStates{
}


class AppIntialState extends TdawaStates{


}

class displayFirstSuccessState extends TdawaStates{
}

class displaySecondSuccessState extends TdawaStates{
}

class displayThirdSuccessState extends TdawaStates{
}


class getAppointmentsSuccessState extends TdawaStates{
}

class getAppointmentsLoadingState extends TdawaStates{
}

class getAppointmentsErrorState extends TdawaStates{
  String error;

  getAppointmentsErrorState({required this.error});
}

class getBakaSuccessState extends TdawaStates{
}

class getBakaLoadingState extends TdawaStates{
}

class getBakaErrorState extends TdawaStates{
  String error;

  getBakaErrorState({required this.error});
}


class getDoctorDataSuccessState extends TdawaStates{
}

class getDoctorDataLoadingState extends TdawaStates{
}

class getDoctorDataErrorState extends TdawaStates{
  String error;

  getDoctorDataErrorState({required this.error});
}



class getDoctorAdsSuccessState extends TdawaStates{
}

class getDoctorAdsLoadingState extends TdawaStates{
}

class getDoctorAdsErrorState extends TdawaStates{
  String error;

  getDoctorAdsErrorState({required this.error});
}

class UpdateDoctorAdsSuccessState extends TdawaStates{
}

class UpdateDoctorAdsLoadingState extends TdawaStates{
}

class UpdateDoctorAdsErrorState extends TdawaStates{
  String error;

  UpdateDoctorAdsErrorState({required this.error});
}


class RenewDoctorAdsSuccessState extends TdawaStates{
}

class RenewDoctorAdsLoadingState extends TdawaStates{
}

class RenewDoctorAdsErrorState extends TdawaStates{
  String error;

  RenewDoctorAdsErrorState({required this.error});
}








class addNewAdSuccessState extends TdawaStates{
}

class addNewAdLoadingState extends TdawaStates{
}

class addNewAdErrorState extends TdawaStates{
  String error;

  addNewAdErrorState({required this.error});
}

class setImageSuccessState extends TdawaStates{

}
