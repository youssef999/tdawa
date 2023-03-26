

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







class getBestOffersSuccessState extends PatientStates{
}

class getBestOffersLoadingState extends PatientStates{
}

class getBestOffersErrorState extends PatientStates{

  String error;

  getBestOffersErrorState({required this.error});
}










class setFavSuccessState extends PatientStates{
}

class addToFavSuccessState extends PatientStates{
}

class LoadingFavState extends PatientStates{
}

class FavErrorState extends PatientStates{
  String error;

  FavErrorState({required this.error});
}
class getDoctorsSuccessState extends PatientStates{


  getDoctorsSuccessState();
}
class getDoctorsLoadingState extends PatientStates{


  getDoctorsLoadingState();
}

class getDoctorsErrorState extends PatientStates{


  getDoctorsErrorState();
}



class TopDoctorsSuccessState extends PatientStates{


  TopDoctorsSuccessState();
}
class TopDoctorsLoadingState extends PatientStates{


  TopDoctorsLoadingState();
}

class TopDoctorsErrorState extends PatientStates{


  TopDoctorsErrorState();
}


class getCatSuccessState extends PatientStates{


  getCatSuccessState();
}
class getCatLoadingState extends PatientStates{


  getCatLoadingState();
}

class getCatErrorState extends PatientStates{
String error;

getCatErrorState({required this.error});
}



class SearchSuccessState extends PatientStates{


  SearchSuccessState();
}
class SearchLoadingState extends PatientStates{


  SearchLoadingState();
}

class SearchErrorState extends PatientStates{
  String error;

  SearchErrorState({required this.error});
}


class getUserDataSuccessState extends PatientStates{


  getUserDataSuccessState();
}
class getUserDataLoadingState extends PatientStates{


  getUserDataLoadingState();
}

class getUserDataErrorState extends PatientStates{
  String error;

  getUserDataErrorState({required this.error});
}


class UpdateDataSuccessState extends PatientStates{


  UpdateDataSuccessState();
}
class UpdateDataLoadingState extends PatientStates{


  UpdateDataLoadingState();
}

class UpdateDataErrorState extends PatientStates{
  String error;

  UpdateDataErrorState({required this.error});
}