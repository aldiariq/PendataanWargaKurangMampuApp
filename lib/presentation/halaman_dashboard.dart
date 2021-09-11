import 'package:apppendataanwargakurangmampu/constants/strings.dart';
import 'package:apppendataanwargakurangmampu/cubit/halamandashboard/halamandashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';
import 'package:google_fonts/google_fonts.dart';

class HalamanDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HalamandashboardCubit>(context).setDatalogin();

    return BlocBuilder<HalamandashboardCubit, HalamandashboardState>(
      builder: (context, state) {
        String email = "";
        String name = "";
        if (state is HalamandashboardsetDatalogin) {
          email = state.dataLogin.admin.email;
          name = state.dataLogin.admin.name;
        }
        return Scaffold(
          drawer: _navDrawer(context, email, name),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: WARNA_UTAMA,
            title: Text("Dashboard"),
          ),
          backgroundColor: WARNA_UTAMA,
          body: _isiHalaman(context, name),
        );
      },
    );
  }

  Widget _isiHalaman(context, String name) {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _widgetJarak(30),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Selamat Datang,",
                            style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Text(
                            name,
                            style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.normal)),
                          ),
                        ])),
                Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Column(children: <Widget>[
                      InkWell(
                        onTap: () {
                          _dialogKeluar(context);
                        },
                        child: Image.asset(
                          ICON_MENU_KELUAR,
                          width: 50,
                        ),
                      ),
                    ])),
              ],
            ),
            _widgetJarak(40),
            Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Wrap(
                  children: <Widget>[
                    _widgetCard(context, ICON_MENU_DASHBOARD, MENU_DASHBOARD,
                        HALAMAN_DASHBOARD, NAMA_HALAMAN_GANTI_PASSWORD),
                    _widgetCard(
                        context,
                        ICON_MENU_RUKUN_TETANGGA,
                        MENU_RUKUN_TETANGGA,
                        HALAMAN_RUKUN_TETANGGA,
                        NAMA_HALAMAN_RUKUN_TETANGGA),
                    _widgetCard(context, ICON_MENU_MASYARAKAT, MENU_MASYARAKAT,
                        HALAMAN_MASYARAKAT, NAMA_HALAMAN_MASYARAKAT),
                    _widgetCard(
                        context,
                        ICON_MENU_GANTI_PASSWORD,
                        MENU_GANTI_PASSWORD,
                        HALAMAN_GANTI_PASSWORD,
                        NAMA_HALAMAN_GANTI_PASSWORD),
                  ],
                ),
              ),
            )
          ],
        )
      ],
    ));
  }

  Widget _widgetCard(context, String imageAsset, String menuName,
      String routeName, String peringatan) {
    return InkWell(
      onTap: () {
        _aksialihkanHalaman(context, routeName, peringatan);
      },
      child: SizedBox(
        width: 160,
        height: 160,
        child: Card(
          color: WARNA_CARD,
          elevation: 20,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Image.asset(
                  imageAsset,
                  width: 100,
                ),
                Text(
                  menuName,
                  style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.normal)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _navDrawerHeader(String email, String name) {
    final warnamenuicon = Colors.white;
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
  }

  Widget _navDrawer(context, String email, String name) {
    return Drawer(
      child: Material(
        color: WARNA_UTAMA_LIGHT,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: <Widget>[
              _widgetJarak(30),
              _navDrawerHeader(email, name),
              _widgetJarak(10),
              Divider(color: Colors.white),
              _menuItem(
                  MENU_DASHBOARD,
                  Icons.dashboard_outlined,
                  () => _aksialihkanHalaman(
                      context, HALAMAN_DASHBOARD, NAMA_HALAMAN_DASHBOARD)),
              _widgetJarak(5),
              _menuItem(
                  MENU_RUKUN_TETANGGA,
                  Icons.person_outline,
                  () => _aksialihkanHalaman(
                      context, HALAMAN_DASHBOARD, NAMA_HALAMAN_RUKUN_TETANGGA)),
              _widgetJarak(5),
              _menuItem(
                  MENU_MASYARAKAT,
                  Icons.people_outline,
                  () => _aksialihkanHalaman(
                      context, HALAMAN_DASHBOARD, NAMA_HALAMAN_MASYARAKAT)),
              _widgetJarak(5),
              _menuItem(
                  MENU_GANTI_PASSWORD,
                  Icons.password_outlined,
                  () => _aksialihkanHalaman(
                      context, HALAMAN_DASHBOARD, NAMA_HALAMAN_GANTI_PASSWORD)),
              _widgetJarak(5),
              Divider(color: Colors.white),
              _widgetJarak(5),
              _menuItem(MENU_KELUAR, Icons.login_outlined,
                  () => _dialogKeluar(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _widgetJarak(double jarak) {
    return SizedBox(
      height: jarak,
    );
  }

  Widget _menuItem(String menu, IconData menuicon, VoidCallback callbackMenu) {
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
