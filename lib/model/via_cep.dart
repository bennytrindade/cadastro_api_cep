// To parse this JSON data, do
//
//     final viaCep = viaCepFromJson(jsonString);

import 'dart:convert';

ViaCep viaCepFromJson(String str) => ViaCep.fromJson(json.decode(str));

String viaCepToJson(ViaCep data) => json.encode(data.toJson());

class ViaCep {
  String cep;
  String logradouro;
  String complemento;
  String unidade;
  String bairro;
  String localidade;
  String uf;
  String estado;
  String regiao;
  String ibge;
  String gia;
  String ddd;
  String siafi;

  ViaCep({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.unidade,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.estado,
    required this.regiao,
    required this.ibge,
    required this.gia,
    required this.ddd,
    required this.siafi,
  });

  factory ViaCep.fromJson(Map<String, dynamic> json) => ViaCep(
    cep: json["cep"],
    logradouro: json["logradouro"],
    complemento: json["complemento"],
    unidade: json["unidade"],
    bairro: json["bairro"],
    localidade: json["localidade"],
    uf: json["uf"],
    estado: json["estado"],
    regiao: json["regiao"],
    ibge: json["ibge"],
    gia: json["gia"],
    ddd: json["ddd"],
    siafi: json["siafi"],
  );

  Map<String, dynamic> toJson() => {
    "cep": cep,
    "logradouro": logradouro,
    "complemento": complemento,
    "unidade": unidade,
    "bairro": bairro,
    "localidade": localidade,
    "uf": uf,
    "estado": estado,
    "regiao": regiao,
    "ibge": ibge,
    "gia": gia,
    "ddd": ddd,
    "siafi": siafi,
  };
}
