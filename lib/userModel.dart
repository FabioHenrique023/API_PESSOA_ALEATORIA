import 'package:api_pessoa_aleatoria/userData.dart';

User? user;

preencheUser(Map<String, dynamic> jsonData) {
  User _user = User(nome: jsonData["name"]["first"] + " " + jsonData["name"]["last"]);
  print("_user.nome: " + _user.nome);
  user = _user;
}

getUser() {
  return user;
}
