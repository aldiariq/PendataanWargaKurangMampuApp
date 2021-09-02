import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HalamanMasuk extends StatelessWidget {
  const HalamanMasuk({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
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
                      tombolLogin()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
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

  Widget tombolLogin(){
    return Container(
      width: double.infinity,
      child: ElevatedButton.icon(
        label: Text('Log In'),
        style: ElevatedButton.styleFrom(
          primary: Colors.grey,
          fixedSize: Size(double.infinity, 50)
        ),
        icon: Icon(Icons.login),
        onPressed: () {},
      )
    );
  }
}
