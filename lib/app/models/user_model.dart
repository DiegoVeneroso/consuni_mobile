import 'dart:convert';

import 'package:flutter/material.dart';

class UserModel {
  final int id;
  final String name;
  final String email;
  final String password;
  final String? avatar64;
  final bool? representante;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    this.avatar64,
    this.representante,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'avatar64': avatar64,
      'representante': representante,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      avatar64: map['avatar64'],
      representante: map['representante'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
