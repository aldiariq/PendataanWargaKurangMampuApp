import 'package:flutter/material.dart';

class HalamanDashboard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _navDrawer(),
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
    );
  }

  Widget _navDrawer(){
    return Drawer();
  }
}

