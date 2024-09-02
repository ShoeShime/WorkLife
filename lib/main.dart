import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import "features/TimeRemaining/TimeRemaining.dart";

void main() {
  runApp(const WorkLifeApp());
}

class WorkLifeApp extends StatelessWidget {
  const WorkLifeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WorkLife',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}