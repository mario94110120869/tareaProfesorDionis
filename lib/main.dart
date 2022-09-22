// @dart=2.9

import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'model_usuario.dart';

void main() => runApp(MyApp(usuario: obtenerUsuario()));

Future<Usuario> obtenerUsuario() async {
  final String url = "http://192.168.1.101/phpbackend/obtenerUsuarios.php";
  var uri = Uri.parse(url);
  var response = await http.get(uri);
  // final response = await http
  //     .get(Uri.parse("http://192.168.1.101/phpbackend/obtenerUsuarios.php"));

  if (response.statusCode == 200) {
    return Usuario.fromJson(json.decode(response.body));
  } else {
    throw Exception("Error al obtener el JSON");
  }
}

class MyApp extends StatelessWidget {
  final Future<Usuario> usuario;

  MyApp({Key key, this.usuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "JSON URL",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Información Usuario"),
        ),
        body: Center(
          child: FutureBuilder<Usuario>(
            future: usuario,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text("ID: " +
                    snapshot.data.idUsuario +
                    "\n" +
                    "Nombre: " +
                    snapshot.data.nombre +
                    "\n" +
                    "Telefono: " +
                    snapshot.data.telefono +
                    "\n" +
                    "Email: " +
                    snapshot.data.email);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
