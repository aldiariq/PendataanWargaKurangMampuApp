import 'package:apppendataanwargakurangmampu/constants/strings.dart';
import 'package:apppendataanwargakurangmampu/presentation/halaman_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:apppendataanwargakurangmampu/cubit/splashscreen/splashscreen_cubit.dart';

class RouteApp {

  SplashscreenCubit splashscreenCubit;

  RouteApp(){
    splashscreenCubit = SplashscreenCubit();
  }

  Route generateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case HALAMAN_SPLASH_SCREEN:
        return MaterialPageRoute(builder: (_) => BlocProvider.value(
          value: splashscreenCubit,
          child: HalamanSplashscreen(),
        ));
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