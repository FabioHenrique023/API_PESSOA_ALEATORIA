import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
Future main() async {
  runApp(const MyApp());
  final json = await fetch();
  print(json['results']['name']);
}
Future<Map> fetch() async{
  var url = 'https://randomuser.me/api/';
  var pessoa = await http.get(Uri.parse(url));
  var json = jsonDecode(pessoa.body) as Map<String, dynamic>;
  return json;
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

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'API PESSOA ALEATORIA',
          ),
        backgroundColor: Colors.black
      ),
      body: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            ListTile(
              leading: Icon(Icons.album),
              title: Text('Nome'),
              subtitle: Text('E-mail'),
            )
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        tooltip: 'PESQUISAR',
        child: Icon(Icons.search),
        backgroundColor: Colors.black,
        ),
    );
  }
}
