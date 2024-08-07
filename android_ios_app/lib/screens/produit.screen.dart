import 'package:android_ios_app/models/produit.model.dart';
import 'package:android_ios_app/services/api.service.dart';
import 'package:flutter/material.dart';

class ProduitScreen extends StatefulWidget {
  static const routeName = 'produits';
  const ProduitScreen({super.key});

  @override
  State<ProduitScreen> createState() => _ProduitScreenState();
}

class _ProduitScreenState extends State<ProduitScreen> {
  late Future<List<Produit>> futureProduit;

  @override
  void initState() {
    super.initState();
    futureProduit = ApiService.fetchProduits();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produits'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepPurple),
              icon: const Icon(Icons.shopping_cart),
              label: const Text("Cart"),
            ),
          ),
        ],
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
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.7),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ProduitCart(produit: snapshot.data![index]);
                  },
                ),
              );
            }
            return Center(child: Text("la progration"));
          },
        ),
      ),
    );
  }
}

class ProduitCart extends StatelessWidget {
  final Produit produit;
  const ProduitCart({super.key, required this.produit});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            /*Text("${snapshot.data![index].nom}"),
                                   Image.network(
                                      "${snapshot.data![index].image}"),*/
            Image.network(produit.image),
            Text(" Nom :${produit.nom}"),
            Text("${produit.description}"),
            Text(
              "${produit.prix}CFA",
              style: TextStyle(fontSize: 30),
            ),
            Text("${produit.stock}"),
            Text("${produit.categorie}"),
            
          ],
        ),
      ),
    );
  }
}
