import 'dart:convert';
import 'package:api_pessoa_aleatoria/userData.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:api_pessoa_aleatoria/userModel.dart';

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
  print("Entrou na função getApiUrl\n\n");
  return http.get(Uri.parse("https://randomuser.me/api/"));
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'API PESSOA ALEATORIA',
          ),
          backgroundColor: Colors.black),
      body: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.album),
              title: Text('mostrar dados aqui'),
              subtitle: Text('E-mail'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var response = await getAPiUrl();
          print("Saiu da Função getApiUrl\n\n");
          var jsonResponde = json.decode(response.body)["results"][0];
          //print("jsonResponde[name]: " + jsonResponde["name"]);
          preencheUser(jsonResponde);
          print("Saiu da funcao userMode.preencheUser");
        },
        tooltip: 'PESQUISAR',
        child: const Icon(Icons.search),
        backgroundColor: Colors.black,
      ),
    );
  }
}
