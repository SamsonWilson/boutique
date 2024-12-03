import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurple, Colors.deepOrange],
        ),
        shape: BoxShape.circle,
      ),
      child: const Center(
        child: Text(
          "data",
          style: TextStyle(fontSize: 23),
        ),
      ),
    );
  }
}
