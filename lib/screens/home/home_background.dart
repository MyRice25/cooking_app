import 'package:cooking_app/core/app_button.dart';
import 'package:cooking_app/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBackground extends StatelessWidget {
  const HomeBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(64),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Bắt đầu với những món ăn',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 40),
                BasicAppButton(
                  title: 'Bắt đầu',
                  icon: const Icon(Icons.arrow_forward, color: Colors.white),
                  onPressed: () {
                    Get.to(() => HomePage());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
