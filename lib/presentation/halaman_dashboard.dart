import 'package:apppendataanwargakurangmampu/constants/strings.dart';
import 'package:apppendataanwargakurangmampu/cubit/halamandashboard/halamandashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

class HalamanDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HalamandashboardCubit>(context).setDatalogin();

    return Scaffold(
      drawer: _navDrawer(context),
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Container(),
    );
  }

  Widget _navDrawerHeader() {
    final warnamenuicon = Colors.white;
    return BlocBuilder<HalamandashboardCubit, HalamandashboardState>(
      builder: (context, state) {
        String email = "";
        String name = "";
        if (state is HalamandashboardsetDatalogin) {
          email = state.dataLogin.admin.email;
          name = state.dataLogin.admin.name;
        }
        return InkWell(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/logoadmin.png')),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(email, style: TextStyle(color: warnamenuicon)),
                    const SizedBox(height: 4),
                    Text(name, style: TextStyle(color: warnamenuicon)),
                  ],
                )
              ],
            ),
          ),
        );
      },
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
              widgetJarak(30),
              _navDrawerHeader(),
              widgetJarak(10),
              Divider(color: Colors.white),
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
