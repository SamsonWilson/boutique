import 'package:flutter/foundation.dart';

class ProduitService {
  Future<List<Category>> categories() async {
    final response = await http.get('${Config.apiUrl}/categories');
     if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
        return parsed
            .map((Category)(()) => Produit.fromJson(produit))
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
