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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const HeroPages(),
            )
          ],
        )
        // const Center(
        //   child: Text('Home Screen', style: TextStyle(color: Colors.blue)),
        // ),
        );
  }
}

class HeroPages extends StatefulWidget {
  const HeroPages({super.key});

  @override
  State<HeroPages> createState() => _HeroPagesState();
}

class _HeroPagesState extends State<HeroPages> {
  @override
  Widget build(BuildContext context) {
    return Container(
     
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: bor
      ),
    );
  }
}
