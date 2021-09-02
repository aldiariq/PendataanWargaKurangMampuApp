import 'package:apppendataanwargakurangmampu/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:apppendataanwargakurangmampu/cubit/splashscreen/splashscreen_cubit.dart';

class HalamanSplashscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SplashscreenCubit>(context).jalankanTimer();
    return Scaffold(
      backgroundColor: Colors.blue,
      body: BlocListener<SplashscreenCubit, SplashscreenState>(
        listener: (context, state) {
          if(state is SelesaiSplash) {
            Navigator.pushReplacementNamed(context, HALAMAN_MASUK);
          }
        },
        child: _splashScreen(context),
      ),
    );
  }

  Widget _splashScreen(context){
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _gambarSplash(),
            _widgetPadding(),
            _widgetLoading(),
            _widgetPadding(),
            _tulisanSplash("Aplikasi\nPendataan Warga Kurang Mampu", 30),
          ],
        ),
      ),
    );
  }

  Widget _gambarSplash(){
    return Center(
      child: Image.asset(
          "assets/images/logoaplikasi.png",
        height: 100,
        width: 100,
      )
    );
  }

  Widget _tulisanSplash(String tulisan, double besarHuruf){
    return Center(
      child: Text(
        tulisan,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Staatliches',
          color: Colors.white,
          fontSize: besarHuruf
        ),
      )
    );
  }

  Widget _widgetPadding(){
    return Padding(
      padding: EdgeInsets.only(
        top: 30,
        bottom: 30
      ),
    );
  }

  Widget _widgetLoading(){
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.white,
      ),
    );
  }
}
