import 'package:breeds/ui/detailPage.dart';
import 'package:breeds/ui/landingPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Razas de gatos',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      initialRoute: 'landing',
      routes: {
        'landing': (context) => LandindgPage(),
        'detail': (context) => DetailPage(),
      },
    );
  }
}
