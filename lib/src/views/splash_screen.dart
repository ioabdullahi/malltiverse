import 'package:flutter/material.dart';
import 'package:malltiverse/src/controllers/splash_screen_controller.dart';
import 'package:malltiverse/utils/app__export.dart';
import 'package:malltiverse/utils/image_constant.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           CustomImageView(
            imagePath: ImageConstant.mallTiverseLogo,
            width: 233.0,
            height: 33.0,
           ),
            SizedBox(height: 20),
            Text(
              'Welcome to Malltiverse',
              style: TextStyle(
                color: appTheme.redA100,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
