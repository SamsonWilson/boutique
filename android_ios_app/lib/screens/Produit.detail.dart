<<<<<<< HEAD
import 'package:android_ios_app/commen/ui.dart';
import 'package:android_ios_app/models/produit.model.dart';
import 'package:flutter/material.dart';

class ProduitDTScreen extends StatelessWidget {
  static const routeName = 'produit-detail';
=======
import 'package:flutter/material.dart';

class ProduitDTScreen extends StatelessWidget {
>>>>>>> 4cd1d19baf82a1b03fa244eb0d4b1e3913bdca20
  const ProduitDTScreen({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD

    final produit = ModalRoute.of(context)!.settings.arguments as Produit;
    return Scaffold(
      appBar: AppBar(
        title:  Text(produit.nom),
      ),
      body:Container(
        decoration:DefaultScrennDecoretion,/** la decoration des produit */
        child: ListView(
        children: [
           Hero(tag: produit.id, child: Image.network(produit.image),),
          Padding(padding: const EdgeInsets.all(8.0),
          child:

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [ 
              Expanded(
             
                child: Text(produit.nom,
                  style: const TextStyle(
                    fontSize: 24,fontWeight: FontWeight.bold,
                  ),
              ),
              ),
              Text("\$${produit.prix}",
              style: const TextStyle(
                fontSize: 30,fontWeight: FontWeight.bold,
                color: Colors.deepPurpleAccent,
              ),
              ),
            ], 
          ),
           ),

           Padding(padding: const EdgeInsets.all(8.0),
            child: Text(produit.description,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            ),
            ),       
        ],
        ),
      )
=======
    return Scaffold(
      body: Center(
        child: Text("Les Details du Produit"),
      ),
>>>>>>> 4cd1d19baf82a1b03fa244eb0d4b1e3913bdca20
    );
  }
}
