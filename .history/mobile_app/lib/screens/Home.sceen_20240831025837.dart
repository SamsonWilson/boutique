import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const TextField(
          decoration: InputDecoration(
              hintText: 'Recherche',
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search)),
        ),
      ),
       body: Container(
        color: bl,
       )
      // const Center(
      //   child: Text('Home Screen', style: TextStyle(color: Colors.blue)),
      // ),
    );
  }
}
