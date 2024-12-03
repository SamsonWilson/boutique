// import 'dart:convert';
// import 'package:android_ios_app/models/produit.model.dart';
// import 'package:http/http.dart' as http;

// class ApiService {
//   static Future<List<Produit>> fetchProduits() async {
//     var response =
//         await http.get(Uri.parse("http://127.0.0.1:8000/api/produits/"));
//     if (response.statusCode == 200) {
//       List DProduit = jsonDecode(response.body);

//       return DProduit.map((produit) => Produit.fromJson(produit)).toList();
//     }
//     throw Exception("une erreur");
//   }

//   /*throw Exception("une erreur est survenu");*/
// }
import 'dart:convert';
import 'package:android_ios_app/models/produit.model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<Produit>> fetchProduits() async {
    try {
      final response =
          await http.get(Uri.parse("http://10.0.2.2:8000/api/produits/"));

      if (response.statusCode == 200) {
        List<dynamic> decodedProduits = jsonDecode(response.body);
        return decodedProduits
            .map((produit) => Produit.fromJson(produit))
            .toList();
      } else {
        // Gestion des codes d'erreur HTTP
        throw Exception(
            "Échec du chargement des produits, code : ${response.statusCode}");
      }
    } catch (e) {
      // Gestion des erreurs de réseau ou autres
      throw Exception(
          "Une erreur est survenue lors de la récupération des produits : $e");
    }
  }
}
