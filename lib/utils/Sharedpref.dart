import 'dart:convert';

import 'package:apppendataanwargakurangmampu/model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sharedpref {

  String _rawdataLogin;

  void setDatalogin(Login dataLogin) async {
    _rawdataLogin = jsonEncode(dataLogin);
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("data_login", _rawdataLogin);
  }

  Future<Login> getDatalogin() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _rawdataLogin = sharedPreferences.getString("data_login");
    if(_rawdataLogin != null){
      Map<String, dynamic> decodedataLogin = jsonDecode(_rawdataLogin);
      Login dataLogin = Login.fromJson(decodedataLogin);
      return dataLogin;
    }else {
      return null;
    }
  }

  void clearDatalogin() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}