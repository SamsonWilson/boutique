import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'home';
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'personnel',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'about',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
            backgroundColor: Colors.blue,
          ),
        ],
      ),
      body: Container(color: Colors.blue),
    );
  }
}
