import 'package:flutter/material.dart';
import 'cadastro_cep.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: Text("Buscar CEP", style: TextStyle(color: Colors.black)),
        ),
        body: CadastroCep(),
      ),
    );
  }
}
