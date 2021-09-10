import 'package:apppendataanwargakurangmampu/constants/strings.dart';
import 'package:apppendataanwargakurangmampu/cubit/halamanmasuk/halamanmasuk_cubit.dart';
import 'package:apppendataanwargakurangmampu/cubit/splashscreen/splashscreen_cubit.dart';
import 'package:apppendataanwargakurangmampu/cubit/halamandashboard/halamandashboard_cubit.dart';
import 'package:apppendataanwargakurangmampu/network/network_service.dart';
import 'package:apppendataanwargakurangmampu/presentation/halaman_dashboard.dart';
import 'package:apppendataanwargakurangmampu/presentation/halaman_masuk.dart';
import 'package:apppendataanwargakurangmampu/presentation/halaman_splash_screen.dart';
import 'package:apppendataanwargakurangmampu/repository/repository.dart';
import 'package:apppendataanwargakurangmampu/utils/Sharedpref.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteApp {
  SplashscreenCubit splashscreenCubit;
  HalamanmasukCubit halamanMasukCubit;
  HalamandashboardCubit halamandashboardCubit;
  Repository repository;
  Sharedpref sharedpref;

  RouteApp() {
    repository = Repository(NetworkService());
    sharedpref = Sharedpref();
    splashscreenCubit = SplashscreenCubit();
    halamanMasukCubit = HalamanmasukCubit(repository, sharedpref);
    halamandashboardCubit = HalamandashboardCubit();
  }

  Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case HALAMAN_SPLASH_SCREEN:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: splashscreenCubit,
                  child: HalamanSplashscreen(),
                ));
      case HALAMAN_MASUK:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: halamanMasukCubit,
                  child: HalamanMasuk(),
                ));
      case HALAMAN_DASHBOARD:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: halamandashboardCubit,
                  child: HalamanDashboard(),
                ));
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
