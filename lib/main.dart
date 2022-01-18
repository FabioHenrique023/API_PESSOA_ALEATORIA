import 'dart:convert';
import 'dart:ui';
import 'package:api_pessoa_aleatoria/userData.dart';
import 'package:api_pessoa_aleatoria/user_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

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

class _MyHomePageState extends State<MyHomePage> {
  List<User> _users = [];
/*
* Usuário Será Nulo
* late User user
* User? user;
* runtimetype == retornar o tipo de váriavel
*/
  bool temUsuario = false;
  late User user;

  @override
  Widget build(BuildContext context) {
    // if (user == null) {
    //   return Scaffold(
    //     floatingActionButton: FloatingActionButton(
    //       onPressed: () {
    //         setState(() {
    //           exibirApi();
    //           user = userModel.getUser()!;
    //         });
    //       },
    //       tooltip: 'PESQUISAR',
    //       child: const Icon(Icons.search),
    //       backgroundColor: Colors.black,
    //     ),
    //     body: Container(),
    //   );
    // } else {
    //   return Scaffold(
    //     floatingActionButton: FloatingActionButton(
    //       onPressed: () {
    //         setState(() {
    //           exibirApi();
    //           user = userModel.getUser()!;
    //         });
    //       },
    //       tooltip: 'PESQUISAR',
    //       child: const Icon(Icons.search),
    //       backgroundColor: Colors.black,
    //     ),
    //     body: Card(
    //       child: Column(
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           Text(user!.nome),
    //         ],
    //       ),
    //     ),
    //   );
    // }
/*
* Alternador Tenario
* variavel == valor ? condicao1 : condicao2 
* temUser == true ? Card() : Container()
*/
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Person Aleatory',
            style: GoogleFonts.mcLaren(
                fontWeight: FontWeight.w900, color: Colors.redAccent[400]),
          )),
      body: temUsuario == false
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blueAccent[100],
              ),
            )
          :
          // Padding(
          //     padding: const EdgeInsets.only(top: 15.0),
          //     child: Card(
          //       color: Colors.blueAccent,
          //       child: Column(
          //         mainAxisSize: MainAxisSize.min,
          //         children: <Widget>[
          //           ListTile(
          //             leading: const Icon(Icons.album),
          //             title: Text(
          //               "Nome: " + user!.nome,
          //               style: const TextStyle(color: Colors.white),
          //             ),
          //             subtitle: Text(
          //               "Localização: " + user!.local,
          //               style: const TextStyle(color: Colors.white),
          //             ),
          //           ),
          //           Image.network(user!.image),
          //         ],
          //       ),
          //     ),
          //   ),
          /* Padding(
              padding: const EdgeInsets.fromLTRB(
                  15.0, 0, 15.0, 90.0), //left, top, right, bottom
              child: Card(
                elevation: 4,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 20.0)),
                    CircleAvatar(
                      radius: 100,
                      backgroundImage: NetworkImage(
                        user.image,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        user.nome + "-" + user.idade,
                        style: GoogleFonts.pacifico(
                            color: Colors.black, fontSize: 30.0),
                        textAlign: TextAlign.center,
                      ),
                      subtitle: Text(
                        "Mora em/no " + user.local,
                        style: TextStyle(
                            fontSize: 20.0, color: Colors.grey[800]),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        user.email,
                        style: GoogleFonts.roboto(
                            color: Colors.grey[800], fontSize: 20.0),
                        textAlign: TextAlign.center,
                      ),
                      subtitle: Text(
                        user.phone,
                        style: TextStyle(color: Colors.grey[800],
                        fontSize: 20.0 
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        user.date,
                        textAlign: TextAlign.center,
                      ),
                      
                    )
                  ],
                ),
              ),
            ),*/
          // ignore: avoid_unnecessary_containers
          //Card Usuários
          ListView.builder(
              itemCount: _users.length,
              itemBuilder: (context, index) {
                return UserCard(user: _users[index], isExpanded: false);
              }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            temUsuario = true;
            _users.add(User.fromMap(exibirApi()));
          });
        },
        label: Row(
          children: const [Icon(Icons.search), Text('Pesquisar')],
        ),
        backgroundColor: Colors.redAccent[400],
      ),
    );
  }

  /*Pego minha api metodo get*/
  Future<Map<String, dynamic>> getAPiUrl() async {
    var response = await http.get(Uri.parse("https://randomuser.me/api/"));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponde =
          json.decode(response.body)["results"][0];
      return jsonResponde;
    } else {
      throw Exception('Erro');
    }
  }

  exibirApi() {
    getAPiUrl().then((value) {
      setState(() {
        _users.add(User.fromMap(value));
      });
    });
  }
}
