
import 'package:profiles/app/models/nameModel.dart';
import 'package:profiles/app/models/pictureModel.dart';

class Users {
  late String gender;
  late Name name;
  late String email;
  late String phone;
  late Picture picture; // Large picture URL

  Users({
    required this.gender,
    required this.name,
    required this.email,
    required this.phone,
    required this.picture, // Only need one picture URL for display
  });

  Users.fromJson(Map<String, dynamic> json) {
    gender = json['gender'];
    name = Name.fromJson(json['name']);
    email = json['email'];
    phone = json['phone'];
       picture = Picture.fromJson(json['picture']);
 // Use the large picture URL or medium if large is not available
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gender'] = this.gender;
    data['name'] = this.name.toJson();
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['picture'] = this.picture.toJson(); // Convert to string
    return data;
  }
}
