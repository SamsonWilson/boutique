import 'package:mobile_app/widget/config.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';

class ProduitService {
  Future<List<Category>> categories() async {
    final response = await http.get('${Config.apiUrl}/categories');
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<Category>((json) => Category.fromJson(json)).toList();
    } else {
      throw Exception('Invalid');
    }
  }
}
