import 'dart:convert';

import 'admin_model.dart';

Login welcomeFromJson(String str) => Login.fromJson(json.decode(str));

String welcomeToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    this.status,
    this.pesan,
    this.token,
    this.admin,
  });

  bool status;
  String pesan;
  String token;
  Admin admin;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    status: json["status"],
    pesan: json["pesan"],
    token: json["token"],
    admin: Admin.fromJson(json["admin"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "pesan": pesan,
    "token": token,
    "admin": admin.toJson(),
  };
}
