class ProductModel {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String price;

  ProductModel({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      imageUrl: json['imageUrl'],
      title: json['title'],
      subtitle: json['subtitle'],
      price: json['price'],
    );
  }
}
