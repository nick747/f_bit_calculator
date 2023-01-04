import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sub extends StatefulWidget {
  const Sub({super.key});

  @override
  State<Sub> createState() => _SubState();
}

class _SubState extends State<Sub> {

  final bin_1 = TextEditingController();
  final bin_2 = TextEditingController();
  bool showDecimal = false;
  bool pressed = false;

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
                controller: bin_1,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: bin_1.clear,
                    icon: const Icon(Icons.clear),
                  ),
                  hintText: 'First Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.00),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: bin_2,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: bin_2.clear,
                    icon: const Icon(Icons.clear),
                  ),
                  hintText: 'Second Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.00),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    child: const Text('Sub', style: TextStyle(color: Colors.black),),
                    onPressed: () {
                      pressed = true;
                      setState(() {});
                    },
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const Text('Bin'),
                  const SizedBox(
                    width: 5,
                  ),
                  Switch(
                    value: showDecimal,
                    onChanged: (value) {
                      setState(() {
                        showDecimal = value;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text('Dec'),
                ],
              ),
              const SizedBox(
                height: 75,
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
                  pressed
                      ? showDecimal
                          ? decimalSub(bin_1.text, bin_2.text).toString()
                          : binarySub(bin_1.text, bin_2.text)
                      : 'Insert a number',
                  style: TextStyle(
                      fontSize: 30,
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
                    'To subtract two binary numbers insert them in the textfield (the least significant digit should be on the right), for example: \n 10111001 - 11000101.'),
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

String binarySub(String a, String b) {
  if (!isBinary(a) || !isBinary(b)) {
    return 'Error';
  }
  String subString = '';

  int aInt = int.parse(a, radix: 2);
  int bInt = int.parse(b, radix: 2);
  int subInt = aInt - bInt;
  if (subInt.isNegative) {
    subString = subInt.toRadixString(2).padLeft(4, '0');
  } else {
    subString = subInt.toRadixString(2).padLeft(4, '0');
  }
  return subString;
}

int? decimalSub(String a, String b) {
  if (!isBinary(a) || !isBinary(b)) {
    return null;
  }

  int aInt = int.parse(a, radix: 2);
  int bInt = int.parse(b, radix: 2);
  int sumInt = aInt - bInt;
  return sumInt;
}