

abstract class AuthStates{
}


class AppIntialState extends AuthStates{


}

class LoginSuccessState extends AuthStates{



  LoginSuccessState();
}

class LoginLoadingState extends AuthStates{

}

class LoginErrorState extends AuthStates{

  final String error;

  LoginErrorState(this.error);
}


class UserLoginSuccessState extends AuthStates{



  UserLoginSuccessState();
}







class SalesLoginLoadingState extends AuthStates{

}

class SalesLoginErrorState extends AuthStates{

  final String error;

  SalesLoginErrorState(this.error);
}


class SalesLoginSuccessState extends AuthStates{



  SalesLoginSuccessState();
}














class AddNewFilterLoadingState extends AuthStates{

}

class AddNewFilterErrorState extends AuthStates{

  final String error;

  AddNewFilterErrorState(this.error);
}


class AddNewFilterSuccessState extends AuthStates{
  AddNewFilterSuccessState();
}

class AddNewPlacesLoadingState extends AuthStates{

}

class AddNewPlacesErrorState extends AuthStates{

  final String error;

  AddNewPlacesErrorState(this.error);
}


class AddNewPlacesSuccessState extends AuthStates{
  AddNewPlacesSuccessState();
}


class AddNewPlacesLoadingState2 extends AuthStates{

}

class AddNewPlacesErrorState2 extends AuthStates{

  final String error;

  AddNewPlacesErrorState2(this.error);
}


class AddNewPlacesSuccessState2 extends AuthStates{
  AddNewPlacesSuccessState2();
}












class UserLoginLoadingState extends AuthStates{

}

class UserLoginErrorState extends AuthStates{

  final String error;

  UserLoginErrorState(this.error);
}











class RegisterSuccessState extends AuthStates{

}

class RegisterLoadingState extends AuthStates{

}

class RegisterErrorState extends AuthStates{

  final String error;

  RegisterErrorState(this.error);
}





class SalesCoinsSuccessState extends AuthStates{

}

class SalesCoinsLoadingState extends AuthStates{

}

class SalesCoinsErrorState extends AuthStates{

  final String error;

  SalesCoinsErrorState(this.error);
}










class UserRegisterSuccessState extends AuthStates{

}

class UserRegisterLoadingState extends AuthStates{

}

class UserRegisterErrorState extends AuthStates{

  final String error;

  UserRegisterErrorState(this.error);
}
















class setImageSuccessState extends AuthStates{

}





class SendDeviceIdSuccessState extends AuthStates{

}

class SendDeviceIdLoadingState extends AuthStates{

}

class SendDeviceIdErrorState extends AuthStates{

  final String error;

  SendDeviceIdErrorState(this.error);
}

class sendImageToServerSuccessState extends AuthStates{


}
class sendImageToServerLoadingState extends AuthStates{


}


class addNewSuccess extends AuthStates{


}


class ChangeToogleIndexSuccessState extends AuthStates{


}


class removeNewSuccess extends AuthStates{


}

class removeNewSuccess2 extends AuthStates{


}

class addNewSuccess2 extends AuthStates{


}

class sendImageToServerErrorState extends AuthStates{
String error;

sendImageToServerErrorState({required this.error});

}
