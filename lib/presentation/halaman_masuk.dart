import 'package:apppendataanwargakurangmampu/constants/strings.dart';
import 'package:apppendataanwargakurangmampu/cubit/halamanmasuk/halamanmasuk_cubit.dart';
import 'package:apppendataanwargakurangmampu/utils/Sharedpref.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

class HalamanMasuk extends StatelessWidget {

  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();
  Sharedpref sharedpref = Sharedpref();

  @override
  Widget build(BuildContext context) {
    sharedpref.getDatalogin().then((dataLoginsharedpred){
      if(dataLoginsharedpred != null && dataLoginsharedpred.status){
        _widgetToast(context, "Selamat Datang, " + dataLoginsharedpred.admin.name);
        Navigator.pushReplacementNamed(context, HALAMAN_DASHBOARD);
      }
    });

    return Scaffold(
        body: BlocListener<HalamanmasukCubit, HalamanmasukState>(
          listener: (context, state){
            if(state is PeringatanMasuk){
              _widgetToast(context, state.peringatan);
            }else if(state is ProsesMasuk){
              _widgetToast(context, "Mohon Tunggu Sebentar");
            }else if(state is SelesaiProsesMasuk) {
              _widgetToast(context, "Berhasil Login");
              sharedpref.setDatalogin(state.dataLogin);
              Navigator.pushReplacementNamed(context, HALAMAN_DASHBOARD);
            }
          },
          child: _isiHalaman(context),
        )
    );
  }

  Widget widgetJarak(double jarak){
    return SizedBox(
      height: jarak,
    );
  }

  Widget textfieldEmail(){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Email",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 10),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 6,
                  offset: Offset(0, 2)
                )
              ]
            ),
            height: 60,
            child: TextField(
              controller: _controllerEmail,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.email
                ),
                hintText: "Email",
                hintStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20
                )
              ),
            ),
          )
        ]
    );
  }

  Widget textfieldPassword(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Password",
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold
          ),
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
                    color: Colors.black,
                    blurRadius: 6,
                    offset: Offset(0, 2)
                )
              ]
          ),
          height: 60,
          child: TextField(
            controller: _controllerPassword,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            style: TextStyle(
                fontSize: 20,
                color: Colors.black
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                    Icons.password
                ),
                hintText: "Password",
                hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20
                )
            ),
          ),
        )
      ],
    );
  }

  Widget _tombolUbah(context){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Center(
        child: Text("Simpan", style: TextStyle(fontSize: 18, color: Colors.black),),
      ),
    );
  }

  Widget _isiHalaman(context){
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff0073e5),
                        Color(0xcc0073e5),
                      ]
                  )
              ),
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 120
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Halaman Log In",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 42,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    widgetJarak(50),
                    textfieldEmail(),
                    widgetJarak(20),
                    textfieldPassword(),
                    widgetJarak(20),
                    InkWell(
                        onTap: () {
                          final email = _controllerEmail.text;
                          final password = _controllerPassword.text;
                          print("User Klik Tombol Login");
                          BlocProvider.of<HalamanmasukCubit>(context).prosesMasuk(email, password);
                        },
                        child: _tombolUbah(context)
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _widgetToast(context, String kata){
    FocusManager.instance.primaryFocus.unfocus();
    Toast.show(kata, context, duration: Toast.LENGTH_SHORT, backgroundColor: Colors.white, textColor: Colors.black, gravity: Toast.BOTTOM);
  }
}
