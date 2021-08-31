import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splashscreen_state.dart';

class SplashscreenCubit extends Cubit<SplashscreenState> {
  SplashscreenCubit() : super(SplashscreenInitial());

  void jalankanTimer() async {
    Timer(Duration(seconds: 5), (){
      emit(SelesaiSplash());
    });
  }
}
