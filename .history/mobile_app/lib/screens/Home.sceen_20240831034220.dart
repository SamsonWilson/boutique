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
            const SizedBox(height: 10),
            const Text("categories"),
            const SizedBox(
              height: 100
            ),
            SizedBox(
              height: 100,
              child: ListView(scrollDirection: axis,)
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
      color: Colors.blue,
      width: 100,
      height: 100,
    );
  }
}
