import 'package:flutter/material.dart';
import 'package:typicons_flutter/typicons_flutter.dart';

class Offer {
  final String title;
  final String description;
  final int pointsRequired;
  final TypIconData icon;

  Offer({
    required this.title,
    required this.description,
    required this.pointsRequired,
    required this.icon
  });
}