import 'package:apppendataanwargakurangmampu/route/routeApp.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(PendataanWargaKurangMampuApp(routeApp: RouteApp(),));
}

class PendataanWargaKurangMampuApp extends StatelessWidget {

  final RouteApp routeApp;

  const PendataanWargaKurangMampuApp({Key key, this.routeApp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
