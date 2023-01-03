import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './views/sum.dart';
import './views/sub.dart';
import './views/mol.dart';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bit Calculator',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Bit Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
int _currentIndex = 0;
  static List<Widget> pages = <Widget>[
    const Sum(),
    const Sub(),
    const Mol(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bit Calculator'),
        centerTitle: true,
      ),
      body: pages[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: 'Sum',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: 'Sub',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: 'Molt',
          ),
        ],
      ),
    );
  }
}
