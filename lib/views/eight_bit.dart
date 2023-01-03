import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EightBit extends StatefulWidget {
  const EightBit({super.key});

  @override
  State<EightBit> createState() => _EightBitState();
}

class _EightBitState extends State<EightBit> {

  final bin_1 = TextEditingController();
  final bin_2 = TextEditingController();
  bool showDecimal = false;
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
            ElevatedButton(
              child: const Text('Sum'),
              onPressed: () {
                pressed = true;
                setState(() {});
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Show in Decimal'),
                const SizedBox(
                  width: 20,
                ),
                Switch(
                  value: showDecimal,
                  onChanged: (value) {
                    setState(() {
                      showDecimal = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 50,
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
                        ? decimalSum(bin_1.text, bin_2.text).toString()
                        : binarySum(bin_1.text, bin_2.text)
                    : 'Insert a number',
                style: TextStyle(
                    fontSize: 30,
                    fontFamily:
                        GoogleFonts.getFont('Fira Mono').fontFamily),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.help, color: Colors.grey[850],),
        backgroundColor: Colors.white,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Help'),
                content: const Text('To sum two binary numbers insert them in the textfield (the least significant digit should be on the right), for example: \n 10111001 + 11000101.'),
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
  String sumString = sumInt.toRadixString(2).padLeft(8, '0');
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