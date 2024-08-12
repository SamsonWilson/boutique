import 'package:android_ios_app/commen/ui.dart';
import 'package:android_ios_app/models/produit.model.dart';
import 'package:android_ios_app/screens/Produit.detail.dart';
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
      decoration: DefaultScrennDecoretion,/* la decoration des produit  */
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
                  padding: const EdgeInsets.all(10.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,),
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
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, ProduitDTScreen.routeName,arguments: produit);
      },
      child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child :Container(
        decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Hero(tag: produit.id, child: Image.network(produit.image, width: 200, height: 100,),),
           
            /*Text(" Nom :${produit.nom}"),*/
           Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              color:Colors.white,
              padding: const EdgeInsets.symmetric(
                vertical: 7,
                horizontal: 11,
              ),
              width: MediaQuery.of(context).size.width,
              
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
              "${produit.prix}CFA",
              style: TextStyle(fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple),
            ),
                Text(produit.nom.length > 15
            ? " ${produit.nom.substring(0,15)}----"
            :produit.nom,
            style: const TextStyle(),),
              ],
            ),
           ))
        ],
      ),
      
        
      ),
      
    )

    ) 
    
    
    
     /*ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child :Container(
        decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Stack(
        children: [
           Image.network(produit.image, width: 200, height: 100,),
            /*Text(" Nom :${produit.nom}"),*/
           Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              color:Colors.white,
              padding: const EdgeInsets.symmetric(
                vertical: 7,
                horizontal: 11,
              ),
              width: MediaQuery.of(context).size.width,
              
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
              "${produit.prix}CFA",
              style: TextStyle(fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple),
            ),
                Text(produit.nom.length > 15
            ? " ${produit.nom.substring(0,15)}----"
            :produit.nom,
            style: const TextStyle(),),
              ],
            ),
           ))
        ],
      ),
      
        
      ),
      
    )*/;
   /* Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            /*Text("${snapshot.data![index].nom}"),
                                   Image.network(
                                      "${snapshot.data![index].image}"),*/
            Image.network(produit.image, width: 100,),
            /*Text(" Nom :${produit.nom}"),*/
            Text("${produit.description}"),
            Text(
              "${produit.prix}CFA",
              style: TextStyle(fontSize: 10),
            ),
            Text("${produit.stock}"),
            Text("${produit.categorie}"),
            Text(produit.nom.length > 15
            ? " ${produit.nom.substring(0,15)}----"
            :produit.nom),
            
          ],
        ),
      ),
    );*/
  }
}
