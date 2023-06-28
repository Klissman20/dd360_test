import 'package:flutter/material.dart';

class CharacterEntity {
  final int id;
  final String name;
  final String description;
  final Image? image;

  CharacterEntity(
      {required this.id,
      required this.name,
      required this.description,
      this.image});
}
