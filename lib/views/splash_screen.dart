import 'package:flutter/material.dart';
import 'package:malltiverse/controllers/splash_screen_controller.dart';
import 'package:malltiverse/utils/app__export.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/Malltiverse-Logo.png'),
            SizedBox(height: 20),
            Text(
              'Welcome to Malltiverse',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
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
