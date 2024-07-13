import 'package:get/get.dart';
import 'package:malltiverse/data/api_client.dart';
import 'package:malltiverse/models/product_list_model.dart';

class ProductsController extends GetxController {
  var isLoading = true.obs;
  var techGadgets = <ProductsModel>[].obs;
  var mensFashion = <ProductsModel>[].obs;
  var womensFashion = <ProductsModel>[].obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      errorMessage('');
      print('Fetching products...');
      var fetchedProducts = await ApiClient().fetchProducts();
      print('Products fetched: ${fetchedProducts.length}');

      // Categorize products
      var techGadgetsList = <ProductsModel>[];
      var mensFashionList = <ProductsModel>[];
      var womensFashionList = <ProductsModel>[];

      for (var product in fetchedProducts) {
        // Assuming each product has a 'categories' field which is a list of strings
        if (product.categories.contains('Tech Gadgets')) {
          techGadgetsList.add(product);
        } else if (product.categories.contains('Men\'s Fashion')) {
          mensFashionList.add(product);
        } else if (product.categories.contains('Women\'s Fashion')) {
          womensFashionList.add(product);
        }
      }

      techGadgets.assignAll(techGadgetsList);
      mensFashion.assignAll(mensFashionList);
      womensFashion.assignAll(womensFashionList);

    } catch (e) {
      print('Error fetching products: $e');
      errorMessage('Failed to fetch products. Please try again later.');
    } finally {
      isLoading(false);
      print('Fetch products completed');
    }
  }
}
