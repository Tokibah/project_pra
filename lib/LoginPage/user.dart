import 'dart:convert';
import 'package:flutter/services.dart';

class User {
  String username;
  String password;

  User({required this.username, required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(username: json['username'], password: json['password']);
  }
}

Future<List<User>> fetchJson() async {
  final jsonfile = await rootBundle.loadString("assets/user.json");
  final jsonData = jsonDecode(jsonfile)['users'] as List;
  List<User> userdata = jsonData.map((e) => User.fromJson(e)).toList();
  return userdata;
}


Future<bool> verifyUser(String? inUsername) async {
  final userdata = await fetchJson();
  try {
    userdata.firstWhere((user) => inUsername == user.username);
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> verifyPassword(String? inPassword) async {
  final userdata = await fetchJson();
  try {
    userdata.firstWhere((user) => inPassword == user.password);
    return true;
  } catch (e) {
    return false;
  }
}
