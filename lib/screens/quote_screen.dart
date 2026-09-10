import 'package:flutter/material.dart';
import 'dart:math';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  final List<String> _quotes = [
    "Every Day Make A Step Towards your Goals",
    "Discipline beats motivation on the hard days",
    "Small progress is still progress",
    "Consistency compounds over time",
  ];

  int _currentIndex = 0;
  final Random _random = Random();

  void _generateNewQuote() {
    setState(() {
      int newIndex;
      do {
        newIndex = _random.nextInt(_quotes.length);
      } while (newIndex == _currentIndex && _quotes.length > 1);
      _currentIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Random Quote Generator",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                _quotes[_currentIndex],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.cyanAccent,
                  fontSize: 24,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Quote By: Aryan Anand",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: _generateNewQuote,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyanAccent,
                  foregroundColor: Colors.black,
                ),
                child: const Text("New Quote"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => print("You clicked the elevated button"),
                child: const Text("Inspire Me", style: TextStyle(fontSize: 23)),
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () =>
                    print("-----------------Button Clicked-----------------"),
                child: const Text(
                  "Click Me",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
