import 'package:apppendataanwargakurangmampu/constants/strings.dart';
import 'package:apppendataanwargakurangmampu/utils/Sharedpref.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class HalamanDashboard extends StatelessWidget {

  Sharedpref sharedpref = Sharedpref();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _navDrawer(context),
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
    );
  }

  Widget _navDrawer(context){
    return Drawer(
      child: Material(
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: <Widget>[
              widgetJarak(48),
              menuItem("Dashboard", Icons.dashboard_outlined, () => alihkanHalaman(context, 0)),
              widgetJarak(5),
              menuItem("Rukun Tetangga", Icons.person_outline, () => alihkanHalaman(context, 1)),
              widgetJarak(5),
              menuItem("Masyarakat", Icons.people_outline, () => alihkanHalaman(context, 2)),
              widgetJarak(5),
              menuItem("Ganti Password", Icons.password_outlined, () => alihkanHalaman(context, 3)),
              widgetJarak(5),
              Divider(color: Colors.white),
              widgetJarak(5),
              menuItem("Keluar", Icons.login_outlined, () => alihkanHalaman(context, 4)),
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

  Widget menuItem(String menu, IconData menuicon, VoidCallback callbackMenu){
    final warnamenuicon = Colors.white;
    return ListTile(
      leading: Icon(menuicon, color: warnamenuicon),
      title: Text(menu, style: TextStyle(color: warnamenuicon)),
      onTap: callbackMenu,
    );
  }

  void alihkanHalaman(BuildContext context, int kodeMenu) {
    switch(kodeMenu){
      case 0:
        _widgetToast(context, "Halaman Dashboard");
        Navigator.pushReplacementNamed(context, HALAMAN_DASHBOARD);
        break;
      case 1:
        _widgetToast(context, "Halaman Rukun Tetangga");
        Navigator.pushReplacementNamed(context, HALAMAN_DASHBOARD);
        break;
      case 2:
        _widgetToast(context, "Halaman Masyarakat");
        Navigator.pushReplacementNamed(context, HALAMAN_DASHBOARD);
        break;
      case 3:
        _widgetToast(context, "Halaman Ganti Password");
        Navigator.pushReplacementNamed(context, HALAMAN_DASHBOARD);
        break;
      case 4:
        _showDialog(context);
        break;
    }
  }

  Widget _widgetToast(context, String kata){
    FocusManager.instance.primaryFocus.unfocus();
    Toast.show(kata, context, duration: Toast.LENGTH_SHORT, backgroundColor: Colors.white, textColor: Colors.black, gravity: Toast.BOTTOM);
  }

  void _showDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi Keluar'),
          content: const Text('Apakah Ingin Keluar Aplikasi?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Tidak'),
              child: const Text('Tidak'),
            ),
            TextButton(
              onPressed: (){
                sharedpref.clearDatalogin();
                _widgetToast(context, "Berhasil Keluar");
                Navigator.pushReplacementNamed(context, HALAMAN_MASUK);
              },
              child: const Text('Ya'),
            ),
          ],
        );
      },
    );
  }

}

