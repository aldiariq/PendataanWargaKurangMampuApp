import 'package:apppendataanwargakurangmampu/constants/strings.dart';
import 'package:apppendataanwargakurangmampu/cubit/halamanmasuk/halamanmasuk_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

class HalamanMasuk extends StatelessWidget {
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HalamanmasukCubit>(context).getDatalogin();

    return Scaffold(
        backgroundColor: WARNA_UTAMA,
        body: BlocListener<HalamanmasukCubit, HalamanmasukState>(
          listener: (context, state) {
            if (state is PeringatanMasuk) {
              _widgetToast(context, state.peringatan);
            } else if (state is ProsesMasuk) {
              _widgetToast(context, "Mohon Tunggu Sebentar");
            } else if (state is SelesaiProsesMasuk) {
              _widgetToast(context, "Berhasil Login");
              BlocProvider.of<HalamanmasukCubit>(context)
                  .setDatalogin(state.dataLogin);
              Navigator.pushReplacementNamed(context, HALAMAN_DASHBOARD);
            } else if (state is SelesaiProsesMasukSharedpred) {
              Navigator.pushReplacementNamed(context, HALAMAN_DASHBOARD);
            }
          },
          child: _isiHalaman(context),
        ));
  }

  Widget _widgetJarak(double jarak) {
    return SizedBox(
      height: jarak,
    );
  }

  Widget _textfieldEmail() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Email",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black, blurRadius: 6, offset: Offset(0, 2))
                ]),
            height: 60,
            child: TextField(
              controller: _controllerEmail,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(fontSize: 20, color: Colors.black),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon: Icon(Icons.email),
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.black, fontSize: 20)),
            ),
          )
        ]);
  }

  Widget _textfieldPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Password",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            controller: _controllerPassword,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            style: TextStyle(fontSize: 20, color: Colors.black),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.password),
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.black, fontSize: 20)),
          ),
        )
      ],
    );
  }

  Widget _tombolUbah(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          "Masuk",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
    );
  }

  Widget _isiHalaman(context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(color: WARNA_UTAMA),
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Halaman Log In",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 42,
                          fontWeight: FontWeight.bold),
                    ),
                    _widgetJarak(25),
                    Image.asset(
                      ICON_MENU_LOGIN,
                      width: 100,
                    ),
                    _widgetJarak(40),
                    _textfieldEmail(),
                    _widgetJarak(20),
                    _textfieldPassword(),
                    _widgetJarak(20),
                    InkWell(
                        onTap: () {
                          final email = _controllerEmail.text;
                          final password = _controllerPassword.text;
                          print("User Klik Tombol Login");
                          BlocProvider.of<HalamanmasukCubit>(context)
                              .prosesMasuk(email, password);
                        },
                        child: _tombolUbah(context))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _widgetToast(context, String kata) {
    FocusManager.instance.primaryFocus.unfocus();
    Toast.show(kata, context,
        duration: Toast.LENGTH_SHORT,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        gravity: Toast.BOTTOM);
  }
}
