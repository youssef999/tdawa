

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


class RegisterSuccessState extends AuthStates{

}

class RegisterLoadingState extends AuthStates{

}

class RegisterErrorState extends AuthStates{

  final String error;

  RegisterErrorState(this.error);
}




class SendDeviceIdSuccessState extends AuthStates{

}

class SendDeviceIdLoadingState extends AuthStates{

}

class SendDeviceIdErrorState extends AuthStates{

  final String error;

  SendDeviceIdErrorState(this.error);
}


