class Produit {
  final int id;
  final String nom;
  final String description;
  final double prix;
  final String image;
  final int stock;
  final String categorie;

  Produit({
    required this.id,
    required this.nom,
    required this.description,
    required this.prix,
    required this.image,
    required this.stock,
    required this.categorie,
  });

  factory Produit.fromJson(Map<String, dynamic> json) {
    return Produit(
      id: int.parse(json['id'].toString()),
      nom: json['nom'] ?? '',
      description: json['description'] ?? '',
      prix: double.parse(json['prix'].toString()),
      image: json['image'] ?? '',
      stock: int.parse(json['stock'].toString()),
      categorie: json['categorie']?.toString() ?? '',
    );
  }
}