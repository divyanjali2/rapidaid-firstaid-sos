import 'package:flutter/material.dart';

class GuideStep {
  final String title;
  final String content;

  GuideStep({required this.title, required this.content});
}

class Guide {
  final String id;
  final String title;
  final List<GuideStep> steps;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;

  Guide({
    required this.id,
    required this.title,
    required this.steps,
    this.icon = Icons.health_and_safety,
    this.iconColor = Colors.teal,
    this.backgroundColor = const Color(0xFFF0FBF8),
  });
}