import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ifeventos/views/principal.dart';
import 'package:ifeventos/views/questoes.dart';
import 'package:ifeventos/views/simulados.dart';
import 'package:ifeventos/views/teste.dart';



void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IF Eventos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        cursorColor: Colors.white,
        fontFamily: 'Nunito',
      ),
      home: Simulados()
    );
  }
}