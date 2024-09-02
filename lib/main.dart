import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';

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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _hoursLeft = '';

  @override
  void initState() {
    super.initState();
    _calculateHoursLeft();
    _startTimer();
  }

  void _startTimer() {
    // Update every hour
    Future.delayed(const Duration(hours: 1), () {
      _calculateHoursLeft();
      _startTimer();  // restart the timer
    });
  }

  void _calculateHoursLeft() {
    final now = DateTime.now();
    final endOfWeek = DateTime(now.year, now.month, now.day, 23, 59, 59)
        .add(Duration(days: DateTime.daysPerWeek - now.weekday));
    final hoursLeft = endOfWeek.difference(now).inHours;

    setState(() {
      _hoursLeft = hoursLeft.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hours Left in the Week'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Hours left in the week:',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 150,
              backgroundColor: Colors.blue.withOpacity(0.7),
              child: Text(
                _hoursLeft,
                style: const TextStyle(fontSize: 48, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
