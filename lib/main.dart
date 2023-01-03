import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './views/sum.dart';
import './views/sub.dart';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bits-Adder',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Bits-Adder'),
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
        title: const Text('Bits Adder'),
        centerTitle: true,
      ),
      body: pages[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.red,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: 'To Roman',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: 'To Arab',
          ),
        ],
      ),
    );
  }
}

bool isBinary(String s) {
  RegExp regex = RegExp(r'^[01]+$');
  return regex.hasMatch(s);
}

String binarySum(String a, String b) {
  if (!isBinary(a) || !isBinary(b)) {
    return 'Error';
  }

  int aInt = int.parse(a, radix: 2);
  int bInt = int.parse(b, radix: 2);
  int sumInt = aInt + bInt;
  String sumString = sumInt.toRadixString(2).padLeft(4, '0');
  return sumString;
}

int? decimalSum(String a, String b) {
  if (!isBinary(a) || !isBinary(b)) {
    return null;
  }

  int aInt = int.parse(a, radix: 2);
  int bInt = int.parse(b, radix: 2);
  int sumInt = aInt + bInt;
  return sumInt;
}
