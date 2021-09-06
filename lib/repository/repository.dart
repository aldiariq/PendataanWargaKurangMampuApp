import 'package:apppendataanwargakurangmampu/model/login_model.dart';
import 'package:apppendataanwargakurangmampu/network/network_service.dart';

class Repository{
  final NetworkService networkService;

  Repository(this.networkService);

  Future<Login> fungsiLogin(String email, String password) async {
    print("PROSES MASUK REPOSITORY");
    try{
      final dataLogin = {
        "email" : email,
        "password" : password
      };

      final datahasilLogin = await networkService.fungsiLogin(dataLogin);
      return Login.fromJson(datahasilLogin);
    }catch(e){
      return null;
    }
  }
}