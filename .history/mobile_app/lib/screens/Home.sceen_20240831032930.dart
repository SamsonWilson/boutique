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
        body: ListView(
          
children: [
  const SizedBox(height: 10,),
  const Text("categories")
],
        )
        // const Center(
        //   child: Text('Home Screen', style: TextStyle(color: Colors.blue)),
        // ),
        );
  }
}

class Hero extends StatefulWidget {
  const Hero({super.key});

  @override
  State<Hero> createState() => _HeroState();
}

class _HeroState extends State<Hero> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

