import 'package:apppendataanwargakurangmampu/constants/strings.dart';
import 'package:apppendataanwargakurangmampu/presentation/halaman_masuk.dart';
import 'package:apppendataanwargakurangmampu/presentation/halaman_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:apppendataanwargakurangmampu/cubit/splashscreen/splashscreen_cubit.dart';
import 'package:apppendataanwargakurangmampu/cubit/halamanmasuk/halamanmasuk_cubit.dart';

class RouteApp {

  SplashscreenCubit splashscreenCubit;
  HalamanmasukCubit halamanMasukCubit;

  RouteApp(){
    splashscreenCubit = SplashscreenCubit();
    halamanMasukCubit = HalamanmasukCubit();
  }

  Route generateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case HALAMAN_SPLASH_SCREEN:
        return MaterialPageRoute(builder: (_) => BlocProvider.value(
          value: splashscreenCubit,
          child: HalamanSplashscreen(),
        ));
      case HALAMAN_MASUK:
        return MaterialPageRoute(builder: (_) => BlocProvider.value(
          value: halamanMasukCubit,
          child: HalamanMasuk(),
        ));
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