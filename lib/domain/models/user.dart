

class userModel {
  int ?user_id;
  String? user_email;
  String ?user_name;
  String ?user_password;

  userModel({this.user_id, this.user_email, this.user_name, this.user_password});

  factory userModel.fromJson(Map<String,dynamic>json)=>userModel(

      user_id:int.parse(json['doctor_id'].toString()),
     user_email: json['doctor_email'],
     user_name: json['doctor_name'],
      user_password:json['doctor_password']
  );

  Map<String, dynamic> toJson() => {
    //'user_id': user_id,
    'doctor_email': user_email,
    'doctor_name': user_name,
    'doctor_password': user_password
  };
}
