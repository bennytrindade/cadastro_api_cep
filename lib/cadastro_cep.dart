import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cadastro_com_api_cep/model/via_cep.dart';
import 'package:cadastro_com_api_cep/services/api_services.dart';

class CadastroCep extends StatefulWidget {
  const CadastroCep({super.key});

  @override
  State<StatefulWidget> createState() => _CadastroCep();
}

class _CadastroCep extends State<CadastroCep> {
  var _cepController = TextEditingController();
  var _cidadeController = TextEditingController();
  var _logradouroController = TextEditingController();
  var _bairroController = TextEditingController();
  var _estadoController = TextEditingController();

  var _carregando = false;

  Future _buscarCep() async {
    setState(() {
      _carregando = true;
    });

    final cep = _cepController.text;
    final resultadoCep = await ApiServices.getCepInfo(cep: cep);

    _logradouroController.text = resultadoCep.logradouro;
    _cidadeController.text = resultadoCep.localidade;
    _bairroController.text = resultadoCep.bairro;
    _estadoController.text = resultadoCep.estado;

    setState(() {
      _carregando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 250,
                child: TextField(
                  controller: _cepController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "CEP",
                  ),
                ),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  _buscarCep();
                },
                child:
                    _carregando
                        ? SizedBox(
                          width: 15,
                          height: 15,
                          child: CircularProgressIndicator(),
                        )
                        : Text("Buscar"),
              ),
            ],
          ),
          SizedBox(height: 20),
          TextField(
            controller: _logradouroController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Logradouro",
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _bairroController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Bairro",
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _cidadeController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Cidade",
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _estadoController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Estado",
            ),
          ),
        ],
      ),
    );
  }
}
