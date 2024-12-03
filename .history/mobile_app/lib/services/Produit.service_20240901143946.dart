import 'dart:convert';

import 'package:mobile_app/models/category.model.dart';
import 'package:mobile_app/widget/config.dart';
import 'package:http/http.dart' as http;

class ProduitService {
  Future<List<Category>> categories() async {
    final response = await http.get(Uri.parse('${Config.apiUrl}/categories'));
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<Category>((json) => Category.fromJson(json)).toList();
    } else {
      throw Exception('Invalid');
    }
  }
}
