import 'dart:convert';
import 'package:api_pessoa_aleatoria/userData.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:api_pessoa_aleatoria/userModel.dart' as userModel;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/*Pego minha api metodo get*/
Future<http.Response> getAPiUrl() {
  return http.get(Uri.parse("https://randomuser.me/api/"));
}

Future<List<dynamic>> exibirApi() async {
  var response = await getAPiUrl();
  if (response.statusCode == 200) {
    var jsonResponde = json.decode(response.body)["results"][0];
    return userModel.preencheUser(jsonResponde);
  } else {
    throw Exception('Erro');
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override

/*Começa sem usuário*/
  bool temUsuario = false;
  User? user;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'API PESSOA ALEATORIA',
          ),
          backgroundColor: Colors.black),
      body: temUsuario
          ? Container()
          : Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('  ')
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // var response = await getAPiUrl();
          // print("Saiu da Função getApiUrl\n\n");
          // var jsonResponde = json.decode(response.body)["results"][0];
          // //print("jsonResponde[name]: " + jsonResponde["name"]);
          // userModel.preencheUser(jsonResponde);
          // print("Saiu da funcao userMode.preencheUser");
          user = userModel.getUser();
          setState(() {
            temUsuario = true;
            var pegaExibir = user;

          });
        },
        tooltip: 'PESQUISAR',
        child: const Icon(Icons.search),
        backgroundColor: Colors.black,
      ),
    );
  }
}
