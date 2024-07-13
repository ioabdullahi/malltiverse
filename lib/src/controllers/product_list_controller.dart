import 'package:get/get.dart';
import 'package:malltiverse/data/api_client.dart';
import 'package:malltiverse/models/product_list_model.dart';

class ProductsController extends GetxController {
  var isLoading = true.obs;
  var products = <ProductsModel>[].obs;
  var errorMessage = ''.obs;

  var techGadgets = <ProductsModel>[].obs;
  var mensFashion = <ProductsModel>[].obs;
  var womensFashion = <ProductsModel>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      errorMessage('');
      var fetchedProducts = await ApiClient().fetchProducts();
      products.assignAll(fetchedProducts);

      // Assign all products to each category list
      techGadgets.assignAll(fetchedProducts);
      mensFashion.assignAll(fetchedProducts);
      womensFashion.assignAll(fetchedProducts);
    } catch (e) {
      errorMessage('Failed to fetch products. Please try again later.');
    } finally {
      isLoading(false);
    }
  }
}
