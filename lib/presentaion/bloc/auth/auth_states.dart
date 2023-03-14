

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
