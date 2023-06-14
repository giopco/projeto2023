// @dart=2.9
import 'package:flutter/material.dart';
import 'package:final_project/pages/home_page.dart';

void main() {
  runApp(const Tempo());
}

class Tempo extends StatelessWidget {
  const Tempo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Aplicativo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Aplicativo(),
    );
  }
}
