import 'package:apppendataanwargakurangmampu/constants/strings.dart';
import 'package:apppendataanwargakurangmampu/cubit/halamandashboard/halamandashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

class HalamanDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _navDrawer(context),
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: BlocListener<HalamandashboardCubit, HalamandashboardState>(
        listener: (context, state) {
          print("STATE " + state.toString());
        },
        child: Container(),
      ),
    );
  }

  Widget _navDrawer(context) {
    return Drawer(
      child: Material(
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: <Widget>[
              widgetJarak(48),
              menuItem(
                  "Dashboard",
                  Icons.dashboard_outlined,
                  () => _aksialihkanHalaman(
                      context, HALAMAN_DASHBOARD, "Halaman Dashboard")),
              widgetJarak(5),
              menuItem(
                  "Rukun Tetangga",
                  Icons.person_outline,
                  () => _aksialihkanHalaman(
                      context, HALAMAN_DASHBOARD, "Halaman Rukun Tetangga")),
              widgetJarak(5),
              menuItem(
                  "Masyarakat",
                  Icons.people_outline,
                  () => _aksialihkanHalaman(
                      context, HALAMAN_DASHBOARD, "Halaman Masyarakat")),
              widgetJarak(5),
              menuItem(
                  "Ganti Password",
                  Icons.password_outlined,
                  () => _aksialihkanHalaman(
                      context, HALAMAN_DASHBOARD, "Halaman Ganti Password")),
              widgetJarak(5),
              Divider(color: Colors.white),
              widgetJarak(5),
              menuItem(
                  "Keluar", Icons.login_outlined, () => _dialogKeluar(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget widgetJarak(double jarak) {
    return SizedBox(
      height: jarak,
    );
  }

  Widget menuItem(String menu, IconData menuicon, VoidCallback callbackMenu) {
    final warnamenuicon = Colors.white;
    return ListTile(
      leading: Icon(menuicon, color: warnamenuicon),
      title: Text(menu, style: TextStyle(color: warnamenuicon)),
      onTap: callbackMenu,
    );
  }

  void _aksialihkanHalaman(context, String routeName, String peringatan) {
    _widgetToast(context, peringatan);
    Navigator.pushReplacementNamed(context, routeName);
  }

  void _widgetToast(context, String kata) {
    FocusManager.instance.primaryFocus.unfocus();
    Toast.show(kata, context,
        duration: Toast.LENGTH_SHORT,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        gravity: Toast.BOTTOM);
  }

  void _dialogKeluar(contextroot) {
    showDialog(
      context: contextroot,
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
              onPressed: () {
                BlocProvider.of<HalamandashboardCubit>(contextroot)
                    .clearSharedprefcubit();
                _aksialihkanHalaman(context, HALAMAN_MASUK, "Berhasil Keluar");
              },
              child: const Text('Ya'),
            ),
          ],
        );
      },
    );
  }
}
