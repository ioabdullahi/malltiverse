import 'package:malltiverse/src/views/product_list_screen.dart';
import 'package:malltiverse/utils/app__export.dart';
import 'package:malltiverse/src/views/splash_screen.dart';

class AppRoute {
  static const String checkoutScreen = '/checkout_screen';
  static const String myCartScreen = '/my_cart_screen';
  static const String productListScreen = '/product_list_screen';
  static const String paymentScreen = '/payment_screen';
  static const String splashScreen = '/splash_screen';
  static const String paymentSuccessfulScreen = '/payment_successful_screen';
  static const String initialRoute = '/initial_route';

  static List<GetPage> pages = [
    GetPage(name: productListScreen, page: () => ProductListScreen()),
    GetPage(name: initialRoute, page: () => SplashScreen()),
  ];
}
