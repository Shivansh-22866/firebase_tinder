import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../entities/entities.dart';

class MyUser extends Equatable {
  final String userId;
  final String email;
  final String name;
  final int age;
  final String description;
  final Map<String, double> location;
  final List<String> pictures;

  const MyUser({
    required this.userId,
    required this.email,
    required this.name,
    required this.age,
    required this.description,
    required this.location,
    required this.pictures,
  });

  static const empty = MyUser(
    userId: '',
    email: '',
    name: '',
    age: 0,
    location: {},
    description: '',
    pictures: []
  );

  MyUser copyWith({
    String? userId,
    String? email,
    String? name,
    int? age,
    String? description,
    Map<String, double>? location,
    List<String>? pictures,
  }) {
    return MyUser(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      name: name ?? this.name,
      age: age ?? this.age,
      location: location ?? this.location,
      pictures: pictures ?? this.pictures,
      description: description?? this.description,
    );
  }

  MyUserEntity toEntity() {
    return MyUserEntity(userId: userId, email: email, name: name, age: age, description: description, location: location, pictures: pictures);
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
      userId: entity.userId,
      email: entity.email,
      name: entity.name,
      age: entity.age,
      location: entity.location,
      description: entity.description,
      pictures: entity.pictures,
    );
  }

  @override
  List<Object?> get props => [userId, email, name, age, description, location, pictures];
}
