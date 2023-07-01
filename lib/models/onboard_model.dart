import 'package:flutter/material.dart';

class OnboardModel {
  final String imageUrl;
  final String title;
  final String description;
  final PageController controller;
  OnboardModel({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.controller,
  });
}
