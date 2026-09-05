import 'package:flutter/material.dart';

class MyhomeScreen extends StatelessWidget {
  const MyhomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Worlds App"),
        backgroundColor: const Color.fromARGB(255, 252, 114, 247),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildContainer("Container-1"),
            const SizedBox(width: 20),
            _buildContainer("Container-2"),
            const SizedBox(width: 20),
            _buildContainer("Container-3"),
            const SizedBox(width: 20),
            _buildContainer("Container-4"),
            const SizedBox(width: 20),
            _buildContainer("Container-5"),
          ],
        ),
      ),
    );
  }

  Widget _buildContainer(String label) {
    return Container(
      height: 100,
      width: 150,
      color: const Color.fromARGB(255, 80, 228, 196),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
