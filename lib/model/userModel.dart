// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String number;
  String password;
  String? email;
  String? username;

  UserModel({
    required this.number,
    required this.password,
    this.email,
    this.username,
  });

  UserModel copyWith({
    String? number,
    String? password,
  }) {
    return UserModel(
      number: number ?? this.number,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'number': number,
      'password': password,
    };
  }

  Map<String, dynamic> toMapFullObject() {
    return <String, dynamic>{
      'number': number,
      'password': password,
      'username': username,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      number: map['number'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  String toJsonFull() => json.encode(toMapFullObject());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserModel(number: $number, password: $password)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.number == number && other.password == password;
  }

  @override
  int get hashCode => number.hashCode ^ password.hashCode;
}
