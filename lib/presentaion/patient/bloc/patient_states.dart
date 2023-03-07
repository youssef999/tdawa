

abstract class PatientStates{
}


class AppIntialState extends PatientStates{


}

class getAdsSuccessState extends PatientStates{
}

class getAdsLoadingState extends PatientStates{
}

class getAdsErrorState extends PatientStates{

  String error;

  getAdsErrorState({required this.error});
}


