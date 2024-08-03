import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class AccueilPage extends StatelessWidget {
  const AccueilPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /*leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/Recherche');
          },
          icon: const Icon(Icons.search),
        ),*/
        title: const Text("Accueil"),
        backgroundColor: Color.fromARGB(255, 136, 130, 151),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(103, 67, 82, 82),
                Color.fromARGB(255, 183, 66, 58),
              ]),
        ),
        child: Center(
          child: Column(
            children: [
              /*Text(
                "HOME",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),*/
              MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/Recherche");
                },
                child: const Text(
                  "Recherche",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          /*child: Text(
            'accueil',
            style: TextStyle(
              fontSize: 30,
              color: Colors.deepOrangeAccent,
            ),
          ),*/
        ),
      ),
    );
  }
}

class RecherchePage extends StatelessWidget {
  const RecherchePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /*leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/Recherche');
          },
          icon: const Icon(Icons.search),
        ),*/
        title: const Text("Profil"),
        backgroundColor: Color.fromARGB(255, 136, 130, 151),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(103, 67, 82, 82),
                Color.fromARGB(255, 183, 66, 58),
              ]),
        ),
        child: Center(
          child: Column(
            children: [
              /*Text(
                "HOME",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),*/
              MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/Profil");
                },
                child: const Text(
                  "Profil",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          /*child: Text(
            'accueil',
            style: TextStyle(
              fontSize: 30,
              color: Colors.deepOrangeAccent,
            ),
          ),*/
        ),
      ),
    );
  }
}

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Text("Profile", style: TextStyle(fontSize: 30, color: Colors.white));
  }
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Produit>> futureProduit;

  @override
  void initState() {
    super.initState();
    futureProduit = fetchProduits();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ma page API',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(103, 67, 82, 82),
                      Color.fromARGB(255, 183, 66, 58),
                    ]),
              ),
              child: FutureBuilder(
                future: futureProduit,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }
                  if (snapshot.hasData) {
                    return Center(
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  /*Text("${snapshot.data![index].nom}"),
                                   Image.network(
                                      "${snapshot.data![index].image}"),*/
                                  Image.network(snapshot.data![index].image),
                                  Text(" nom ${snapshot.data![index].nom}"),
                                  Text("${snapshot.data![index].description}"),
                                  Text(
                                    "${snapshot.data![index].prix}CFA",
                                    style: TextStyle(fontSize: 30),
                                  ),
                                  Text("${snapshot.data![index].stock}"),
                                  Text("${snapshot.data![index].categorie}"),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }

                  return Center(child: Text("la progration"));
                },
              ),
            ),
          ),
        ),
      ),
    );
    /* var _currentIndex = 0;
  final _pages = [
    const AccueilPage(),
    const RecherchePage(),
    const ProfilPage(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }
*/
    /* return MaterialApp(
      title: 'navigation',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      routes: {
        '/home': (context) => const AccueilPage(),
        '/Recherche': (context) => const RecherchePage(),
        '/Profil': (context) => const ProfilPage(),
      },
      /*elevation: 0,*/
      home: Scaffold(
        /* bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            currentIndex: _currentIndex,
            backgroundColor: Colors.deepPurpleAccent,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white.withOpacity(.5),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Accuiel',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Recherche',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profil',
              ),
            ],
          ),*/
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(103, 67, 82, 82),
                  Color.fromARGB(255, 183, 66, 58),
                ]),
          ),
          child: Center(
            child: Builder(
              builder: (context) {
                return MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child: const Text(
                    "home",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );*/
  }

  Future<List<Produit>> fetchProduits() async {
    var response =
        await http.get(Uri.parse("http://localhost:8000/api/produits/"));
    if (response.statusCode == 200) {
      List DProduit = jsonDecode(response.body);

      return DProduit.map((produit) => Produit.fromJson(produit)).toList();
    }
    throw Exception("une erreur");
  }

  /*throw Exception("une erreur est survenu");*/
}

class Produit {
  final int id;
  final String nom;
  final String description;
  final double prix;
  final String image;
  final int stock;
  final String categorie;

  Produit({
    required this.id,
    required this.nom,
    required this.description,
    required this.prix,
    required this.image,
    required this.stock,
    required this.categorie,
  });

  factory Produit.fromJson(Map<String, dynamic> json) {
    return Produit(
      id: int.parse(json['id'].toString()),
      nom: json['nom'] ?? '',
      description: json['description'] ?? '',
      prix: double.parse(json['prix'].toString()),
      image: json['image'] ?? '',
      stock: int.parse(json['stock'].toString()),
      categorie: json['categorie']?.toString() ?? '',
    );
  }
}
