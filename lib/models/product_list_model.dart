class ProductsModel {
  final String name;
  final String imageUrl;
  final String description;
  final double price;

  ProductsModel({required this.name, required this.imageUrl, required this.description, required this.price});

  factory ProductsModel.fromJson(Map <String, dynamic> json){

      String imageUrl = 'https://via.placeholder.com/150';
      
    if (json['photos'] != null && json['photos'].isNotEmpty) {
      imageUrl = 'https://api.timbu.cloud/images/' + json['photos'][0]['url'];
    }

    double price = 0.0;
    if (json['current_price'] != null && json['current_price'].isNotEmpty) {
      price = json['current_price'][0]['NGN'][0].toDouble();
    }

    return ProductsModel(
      name: json['name'],
      description: json['description'] ?? 'No description available',
      imageUrl: imageUrl,
      price: price,
    );
  
  }
}