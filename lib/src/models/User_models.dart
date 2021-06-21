import 'dart:convert';


import 'package:turismosangolqui/src/models/Site_models.dart';

User pacientFromJson(String str) => User.fromJson(json.decode(str));
String pacientToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.name,
    required this.surname,
    this.placeOfBirth,
    required this.dateOfBirth,
    this.site,
    //this.secure,
  });

  String name;
  String surname;
  String? placeOfBirth;
  DateTime dateOfBirth;
  List<Site>? site;
  //Secure? secure;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        surname: json["surname"],
        placeOfBirth: json["placeOfBirth"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        site: List<Site>.from(
            json["site"].map((x) => Site.fromJson(x))),
        //secure: Secure.fromJson(json["secure"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "surname": surname,
        "placeOfBirth": placeOfBirth,
        "dateOfBirth":
            "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "allergies": List<dynamic>.from(site!.map((x) => x.toJson())),
        //"secure": secure?.toJson(),
      };
}
