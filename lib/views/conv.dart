import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class Conv extends StatefulWidget {
  const Conv({super.key});

  @override
  State<Conv> createState() => _ConvState();
}

class _ConvState extends State<Conv> {

  final num = TextEditingController();
  final bin = TextEditingController();
  // bool showDecimal = false;
  bool pressed = false;
  bool pressed2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: num,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: num.clear,
                    icon: const Icon(Icons.clear),
                  ),
                  hintText: 'Decimal Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.00),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    child: const Text('Convert', style: TextStyle(color: Colors.black),),
                    onPressed: () {
                      pressed = true;
                      setState(() {});
                    },
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 3.5,
                    color: pressed ? Colors.grey : Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  pressed ? toBinary(int.parse(num.text)) : 'Insert a number', // : toDecimal(bin.text).toString()
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: GoogleFonts.getFont('Fira Mono').fontFamily),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextField(
                controller: bin,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: bin.clear,
                    icon: const Icon(Icons.clear),
                  ),
                  hintText: 'Binary',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.00),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    child: const Text('Convert', style: TextStyle(color: Colors.black),),
                    onPressed: () {
                      pressed2 = true;
                      setState(() {});
                    },
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 3.5,
                    color: pressed2 ? Colors.grey : Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  pressed2 ? toDecimal(bin.text).toString() : 'Insert a number',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: GoogleFonts.getFont('Fira Mono').fontFamily),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Help'),
                content: const Text(
                    'To convert a decimal / binary number to a binary / decimal number first insert the number in the correct textfields, for example: \n 1010 => 10 \n 12 => 1100.'),
                actions: <Widget>[
                  ElevatedButton(
                    child: const Text('Close'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(
          Icons.help,
          color: Colors.grey[850],
        ),
      ),
    );
  }
}

bool isBinary(String s) {
  RegExp regex = RegExp(r'^[01]+$');
  return regex.hasMatch(s);
}

String toBinary(int d) {
  String binary = '';
  while (d / 2 != 0) {
    binary = ((d % 2).toString()) + binary;
    d = d ~/ 2;
  }
  
  return binary;
}

num? toDecimal(String bin) {
  if (!isBinary(bin)) {
    return null;
  }

  int power = 0;
  num dec = 0;
  for (var i = bin.length - 1; i >= 0; i--) {
    if (bin[i] == '1') {
      dec += pow(2, power);
    } else {
      dec += 0;
    }
    
    power++;
  }
  
  return dec;
}