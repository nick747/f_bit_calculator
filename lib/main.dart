import 'package:flutter/material.dart';
import './views/sum.dart';
import './views/sub.dart';
import './views/mol.dart';
import './views/conv.dart';

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
    const Conv(),
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
        backgroundColor: Colors.black,
        title: const Text('Bit Calculator',),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: 'Conv',
          ),
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
