 

class ProduitService {
  Future<List<Category>> categories() async {
    final response = await http.get('${Config.apiUrl}/categories')
  }
 }