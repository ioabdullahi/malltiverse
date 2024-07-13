import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:malltiverse/models/product_list_model.dart';

class ApiClient {
  final String baseUrl = 'https://api.timbu.cloud/products';
  final String apiKey = '78cd6f639262443cb66f4b331496beef20240705134810473796';
  final String organizationId = '242817023c1a46919a7c8db866ae1dc2';
  final String appId = 'I7GZUV064NXH4RH';

  Future<List<ProductsModel>> fetchProducts() async {
    final Uri url = Uri.parse(
        '$baseUrl?organization_id=$organizationId&reverse_sort=false&page=1&size=10&Appid=$appId&Apikey=$apiKey');
    print('Fetching products from: $url');
    final response = await http.get(url);
    
    try {
      if (response.statusCode == 200) {
        List<dynamic> items = json.decode(response.body)['items'];
        print('Fetched products: $items');
        return items.map((item) => ProductsModel.fromJson(item)).toList();
      } else {
        print('Failed to load products: ${response.statusCode}');
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print('Error: $e');
      throw e;
    }
  }
}
