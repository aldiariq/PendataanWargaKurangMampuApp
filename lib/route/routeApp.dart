import 'package:apppendataanwargakurangmampu/constants/strings.dart';
import 'package:flutter/cupertino.dart';

class RouteApp {

  RouteApp(){
  }

  Route generateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case HALAMAN_DASHBOARD:
        return null;
      case HALAMAN_MASUK:
        return null;
      case HALAMAN_DASHBOARD:
        return null;
      case HALAMAN_RUKUN_TETANGGA:
        return null;
      case HALAMAN_MASYARAKAT:
        return null;
      case HALAMAN_GANTI_PASSWORD:
        return null;
      default:
        return null;
    }
  }
}