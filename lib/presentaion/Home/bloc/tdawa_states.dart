

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