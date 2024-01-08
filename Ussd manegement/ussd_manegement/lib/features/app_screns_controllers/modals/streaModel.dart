// To parse this JSON data, do
//
//     final temperatures = temperaturesFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ModelStream ModelStreamFromMap(String str) => ModelStream.fromMap(json.decode(str));

String ModelStreamToMap(ModelStream data) => json.encode(data.toMap());

class ModelStream {
    final int? id;
    final String nipoDeRegisto;
    final String nomeDoCliente;
    final int numeroDoCliente;
    final int numeroDoClienteDoPagamento;
    final String validade;
    final String emailDaConta;
    final String userDaConta;
    final String password;
    final String dataDeSubscricao;

    ModelStream({
        this.id,
        required this.nipoDeRegisto,
        required this.nomeDoCliente,
        required this.numeroDoCliente,
        required this.numeroDoClienteDoPagamento,
        required this.validade,
        required this.emailDaConta,
        required this.userDaConta,
        required this.password,
        required this.dataDeSubscricao,
    });

    factory ModelStream.fromMap(Map<String, dynamic> json) => ModelStream(
        id: json["id"],
        nipoDeRegisto: json["nipoDeRegisto"],
        nomeDoCliente: json["nomeDoCliente"],
        numeroDoCliente: json["numeroDoCliente"],
        numeroDoClienteDoPagamento: json["numeroDoClienteDoPagamento"],
        validade: json["validade"],
        emailDaConta: json["emailDaConta"],
        userDaConta: json["userDaConta"],
        password: json["password"],
        dataDeSubscricao: json["dataDeSubscricao"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nipoDeRegisto": nipoDeRegisto,
        "nomeDoCliente": nomeDoCliente,
        "numeroDoCliente": numeroDoCliente,
        "numeroDoClienteDoPagamento": numeroDoClienteDoPagamento,
        "validade": validade,
        "emailDaConta": emailDaConta,
        "userDaConta": userDaConta,
        "password": password,
        "dataDeSubscricao": dataDeSubscricao,
    };
}
