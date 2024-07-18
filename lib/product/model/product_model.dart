class ProductModel {
  final String id;
  final String name;
  final String description;
  final int price;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
    );
  }
}
