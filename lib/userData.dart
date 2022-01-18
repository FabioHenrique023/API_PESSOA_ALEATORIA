import 'dart:convert';

class User {
  String nome;
  String local;
  String image;
  int idade;
  String email;
  String phone;
  String date;
  String country;

  User({
    required this.nome,
    required this.local,
    required this.image,
    required this.idade,
    required this.email,
    required this.phone,
    required this.date,
    required this.country,
  });

  User copyWith(
      {String? nome,
      String? local,
      String? image,
      int? idade,
      String? email,
      String? phone,
      String? date,
      String? country}) {
    return User(
        nome: nome ?? this.nome,
        local: local ?? this.local,
        image: image ?? this.image,
        idade: idade ?? this.idade,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        date: date ?? this.date,
        country: country ?? this.country);
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'local': local,
      'image': image,
      'idade': idade,
      'email': email,
      'phone': phone,
      'date': date,
      'country': country
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    print("\n\nMAP USER : " + map.toString() + "\n\n");
    return User(
      nome: map['name']["first"] + " " + map['name']["last"] ?? '',
      local: map['location']["street"]["name"] +
              "," +
              map['location']["street"]['number'].toString() ??
          '',
      image: map['picture']['large'] ?? '',
      idade: map['dob']['age'] ?? null,
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      date: map['date'] ?? '',
      country: map['location']['country'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(nome: $nome, local: $local, image: $image, idade: $idade, email: $email, phone: $phone, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.nome == nome &&
        other.local == local &&
        other.image == image &&
        other.idade == idade &&
        other.email == email &&
        other.phone == phone &&
        other.date == date;
  }

  @override
  int get hashCode {
    return nome.hashCode ^
        local.hashCode ^
        image.hashCode ^
        idade.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        date.hashCode;
  }
}
