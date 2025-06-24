import 'package:cooking_app/screens/profile/profile_page.dart';
import 'package:cooking_app/screens/save/save_page.dart';
import 'package:cooking_app/screens/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cooking_app/screens/home/home_menu_page.dart';

class BottomNavController extends GetxController {
  var currentIndex = 0.obs;

  void changeTab(int index) {
    currentIndex.value = index;
  }
}

class CustomBottomNavBar extends StatelessWidget {
  final VoidCallback onFabTap;

  const CustomBottomNavBar({super.key, required this.onFabTap});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BottomNavController>();

    return Obx(
      () => BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(
                Icons.home,
                color:
                    controller.currentIndex.value == 0
                        ? const Color(0xffCEA700)
                        : Colors.grey,
              ),
              onPressed: () => controller.changeTab(0),
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                color:
                    controller.currentIndex.value == 1
                        ? const Color(0xffCEA700)
                        : Colors.grey,
              ),
              onPressed: () => controller.changeTab(1),
            ),
            const SizedBox(width: 40),
            IconButton(
              icon: Icon(
                Icons.bookmark_border,
                color:
                    controller.currentIndex.value == 2
                        ? const Color(0xffCEA700)
                        : Colors.grey,
              ),
              onPressed: () => controller.changeTab(2),
            ),
            IconButton(
              icon: Icon(
                Icons.person_outline,
                color:
                    controller.currentIndex.value == 3
                        ? const Color(0xffCEA700)
                        : Colors.grey,
              ),
              onPressed: () => controller.changeTab(3),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final BottomNavController controller = Get.put(BottomNavController());

  final List<Widget> pages = [
    HomeMenuPage(),
    SearchPage(),
    SavePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[controller.currentIndex.value]),
      bottomNavigationBar: CustomBottomNavBar(
        onFabTap: () {
          // Xử lý khi ấn nút +
          print('FAB pressed');
        },
      ),
      floatingActionButton: SizedBox(
        width: 64,
        height: 64,
        child: FloatingActionButton(
          onPressed: () {
            print('FAB pressed');
          },
          backgroundColor: const Color(0xffCEA700),
          shape: const CircleBorder(),
          child: const Icon(Icons.add_sharp, size: 56, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
