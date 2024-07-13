import 'package:malltiverse/utils/app__export.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 3000));
    Get.offAllNamed(AppRoute.productListScreen);
  }
}
