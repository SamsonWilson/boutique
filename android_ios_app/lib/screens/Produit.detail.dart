import 'package:android_ios_app/commen/ui.dart';
import 'package:android_ios_app/models/produit.model.dart';
import 'package:flutter/material.dart';

class ProduitDTScreen extends StatelessWidget {
  static const routeName = 'produit-detail';
  const ProduitDTScreen({super.key});

  @override
  Widget build(BuildContext context) {

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
    );
  }
}
