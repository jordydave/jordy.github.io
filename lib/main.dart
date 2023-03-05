import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LoveCalculator(),
      ),
    ),
  );
}

class LoveCalculator extends StatefulWidget {
  const LoveCalculator({super.key});

  @override
  LoveCalculatorState createState() => LoveCalculatorState();
}

class LoveCalculatorState extends State<LoveCalculator> {
  final TextEditingController _nameController1 = TextEditingController();
  final TextEditingController _nameController2 = TextEditingController();

  String _result = '';

  void _calculateLove() {
    String name1 = _nameController1.text.toLowerCase();
    String name2 = _nameController2.text.toLowerCase();

    // Check if the submitted names contain only random characters
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(name1) ||
        !RegExp(r'^[a-zA-Z\s]+$').hasMatch(name2)) {
      setState(() {
        _result = 'Please enter valid names!';
      });
      return;
    }

    // Calculate the sum of the ASCII code for each character in both names
    int sum = 0;
    for (int i = 0; i < name1.length; i++) {
      sum += name1.codeUnitAt(i);
    }
    for (int i = 0; i < name2.length; i++) {
      sum += name2.codeUnitAt(i);
    }

    // Calculate the percentage based on the sum
    int percentage = sum % 101;

    // Display the result
    setState(() {
      if (percentage >= 80) {
        _result =
            'Wow, $name1 and $name2 are meant to be! Love percentage is $percentage% ❤️';
      } else if (percentage >= 60) {
        _result =
            '$name1 and $name2 have a good chance of falling in love! Love percentage is $percentage% 💕';
      } else if (percentage >= 40) {
        _result =
            'Hmm, $name1 and $name2 might need to work on their chemistry. Love percentage is $percentage% 💔';
      } else {
        _result =
            'Sorry, $name1 and $name2 are not compatible at all. Love percentage is $percentage% 💔';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Love Calculator'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _nameController1,
              decoration: const InputDecoration(
                labelText: 'Enter your name',
              ),
            ),
            TextField(
              controller: _nameController2,
              decoration: const InputDecoration(
                labelText: 'Enter your partner\'s name',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _calculateLove,
              child: const Text('Calculate'),
            ),
            const SizedBox(height: 16.0),
            Text(
              _result,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
