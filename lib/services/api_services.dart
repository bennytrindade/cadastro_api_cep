import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cadastro_com_api_cep/model/via_cep.dart';

class ApiServices {
  static Future<ViaCep> getCepInfo({String cep = "01001000"}) async {
    String endpoint = "https://viacep.com.br/ws/$cep/json";
    final resposta = await http.get(Uri.parse(endpoint));
    if (resposta.statusCode == 200) {
      return ViaCep.fromJson(jsonDecode(resposta.body));
    }
    throw Exception("Falha ao conectar na API: $endpoint");
  }
}
