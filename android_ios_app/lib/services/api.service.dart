import 'dart:convert';
import 'package:android_ios_app/models/produit.model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<Produit>> fetchProduits() async {
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
