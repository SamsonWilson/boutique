class ProduitService {
  Future<List<Category>> categories() async {
    final response = await http.get('${Config.apiUrl}/categories');
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<
      
  }
}