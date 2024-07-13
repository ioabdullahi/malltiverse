class ProductsModel {
   final String name;
  final String description;
  final String uniqueId;
  final String urlSlug;
  final bool isAvailable;
  final List<String> categories;
  final List<String> photos;
  final double? price;
  final double rating;
  final String imageUrl;
  ProductsModel({
    required this.name,
    required this.description,
    required this.uniqueId,
    required this.urlSlug,
    required this.isAvailable,
    required this.categories,
    required this.photos,
    required this.price,
    required this.rating,
    required this.imageUrl,
  });

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
      uniqueId: json['unique_id'] ?? '',
      urlSlug: json['url_slug'] ?? '',
      description: json['description'] ?? 'No description available',
      imageUrl: imageUrl,
      price: price,
     // rating: json['rating'] ?? 0.0,
      isAvailable: json['is_available'] ?? false,
      categories: List<String>.from(json['categories'] ?? []),
      photos: List<String>.from(json['photos'] ?? []),
      rating: json['rating'] != null ? double.tryParse(json['rating'].toString()) ?? 0.0 : 0.0,

    );
  
  }
}