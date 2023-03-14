

class  DoctorModel {

  int ?doctor_id;
  String? doctor_email;
  String ?doctor_name;
  String ?doctor_password;
  String ?doctor_image;
  String ?doctor_phone;
  String ?doctor_cat;
  String ?cat2;
  String ?doctor_info;
  String ?doctor_degree;
  String ?position;
  String ?price;
  String ?days;

  String ?address;
  String ?address2;
  String ?address3;
  String ?time;
  String ?time2;
  String ?time3;
  String ?location;
  String ?location2;
  String ?location3;

  DoctorModel({

    this.doctor_id, this.doctor_email, this.doctor_name,
    this.doctor_phone,this.doctor_cat,
    this.doctor_degree,this.cat2,this.days,
    this.address,this.address2,this.address3,
    this.time,this.time2,this.time3,
    this.location,this.location2,this.location3,
    this.doctor_info,this.position,this.price,
    this.doctor_password,this.doctor_image


  });

  factory DoctorModel.fromJson(Map<String,dynamic>json)=>DoctorModel(

      doctor_id:int.parse(json['doctor_id'].toString()),
     doctor_email: json['doctor_email'],
     doctor_name: json['doctor_name'],
      days:json["days"],
      doctor_password:json['doctor_password'],
      doctor_cat: json["doctor_cat"],
      cat2:json["cat2"],
      doctor_degree: json["doctor_degree"],
      doctor_info: json["doctor_info"],
      doctor_phone: json["doctor_phone"],
      doctor_image:json['doctor_image'],
      position:json['position'],
      price:json['price'],
     address: json["address1"],
     address2: json["address2"],
     address3: json["address3"],

     time: json["time1"],
     time2: json["time2"],
     time3: json["time3"],

     location: json['location1'],
     location2: json['location2'],
     location3: json['location3'],

  );

  // Map<String, dynamic> toJson() => {
  //   //'user_id': user_id,
  //   'doctor_email': user_email,
  //   'doctor_name': user_name,
  //   'doctor_password': user_password,
  //    'doctor_image':doctor_image
  // };
}
