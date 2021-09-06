import 'dart:convert';

import 'package:apppendataanwargakurangmampu/constants/strings.dart';
import 'package:http/http.dart';

class NetworkService{
  final baseUrl = BASE_URL;

  Future<Map> fungsiLogin(Map<String, String> dataLogin) async {
    print("PROSES MASUK NETWORK SERVICE");
    try{
      final response = await post(Uri.parse(baseUrl + "api/masuk"), body: dataLogin);
      return jsonDecode(response.body);
    }catch(e){
      return null;
    }
  }

}