import 'package:cooking_app/controllers/favorite_controller.dart';
import 'package:cooking_app/controllers/search_controller.dart';
import 'package:cooking_app/models/hive_meal_model.dart';
import 'package:cooking_app/screens/details/details_screens.dart';
import 'package:cooking_app/screens/home/home_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeMenuPage extends StatefulWidget {
  const HomeMenuPage({super.key});

  @override
  State<HomeMenuPage> createState() => _HomeMenuPageState();
}

class _HomeMenuPageState extends State<HomeMenuPage> {
  final favController = Get.put(FavoriteController());
  final searchController = Get.put(SearchControl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe5e3e3),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              HomeSearch(),
              const SizedBox(height: 16),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'TP. HỒ Chí Minh',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Xem tất cả',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          color: Color(0xffCEA700),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 320,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (_, index) {
                        final meal = MealModel(
                          id: 'meal$index',
                          title: 'Cách chiên trứng một cách cung phu',
                          image: 'assets/images/image.png',
                        );
                        return GestureDetector(
                          onTap: () {
                            // Chuyển sang trang chi tiết
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => DetailScreen(meal: meal),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 16),
                            width: 250,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Ảnh + icon play + badge
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(
                                        meal.image,
                                        height: 170,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const Positioned.fill(
                                      child: Center(
                                        child: Icon(
                                          Icons.play_circle_fill,
                                          size: 50,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 8,
                                      left: 8,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 6,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.yellow.shade600,
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: const Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              size: 16,
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              '5',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // THỜI GIAN & FAVORITE
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '1 tiếng 20 phút',
                                            style: TextStyle(
                                              color: Color(0xff0043B3),
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Obx(
                                            () => IconButton(
                                              icon: Icon(
                                                favController.isFavorite(
                                                      meal.id,
                                                    )
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                                color:
                                                    favController.isFavorite(
                                                          meal.id,
                                                        )
                                                        ? Colors.red
                                                        : Colors.black,
                                              ),
                                              onPressed:
                                                  () => favController
                                                      .toggleFavorite(meal),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'Cách chiên trứng một cách cung phu',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: const [
                                          CircleAvatar(
                                            radius: 16,
                                            backgroundImage: AssetImage(
                                              'assets/images/cook.png',
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          Text(
                                            'Đinh Trọng Phúc',
                                            style: TextStyle(
                                              color: Colors.orange,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Categories
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Danh mục',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Xem tất cả',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xffCEA700),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        4,
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Chip(
                            label: Text('Danh mục ${index + 1}'),
                            backgroundColor:
                                index == 0
                                    ? const Color(0xffCEA700)
                                    : Colors.grey.shade200,
                            labelStyle: TextStyle(
                              color: index == 0 ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 220,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder:
                          (_, index) => Container(
                            width: 160,
                            margin: const EdgeInsets.only(right: 16),
                            child: Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.topCenter,
                              children: [
                                // Card bên dưới
                                Positioned(
                                  top: 40,
                                  child: Container(
                                    width: 160,
                                    padding: const EdgeInsets.only(
                                      top: 50,
                                      left: 12,
                                      right: 12,
                                      bottom: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffF8F5E8),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Trứng chiên',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Color(0xff6D4C41),
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        const Text(
                                          'Tạo bởi\nTrần Đình Trọng',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontStyle: FontStyle.normal,
                                            color: Color(0xff432805),
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text(
                                              '20 phút',
                                              style: TextStyle(
                                                color: Color(0xff432805),
                                                fontSize: 12,
                                              ),
                                            ),
                                            Icon(
                                              Icons.copy,
                                              size: 18,
                                              color: Colors.brown,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                // Avatar nằm phía trên
                                const Positioned(
                                  top: 0,
                                  child: CircleAvatar(
                                    radius: 40,
                                    backgroundImage: AssetImage(
                                      'assets/images/logo_cooking.png',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                    ),
                  ),

                  const Text(
                    'Công thức gần đây',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder:
                          (_, index) => Container(
                            margin: const EdgeInsets.only(right: 16),
                            width: 160,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      16,
                                    ), // Bo 4 góc
                                    image: const DecorationImage(
                                      image: AssetImage(
                                        'assets/images/background.png',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                const Padding(
                                  padding: EdgeInsets.all(0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Trứng chiên',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Color(0xff6D4C41),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 4),
                                Padding(
                                  padding: EdgeInsets.all(0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        radius: 16,
                                        backgroundImage: AssetImage(
                                          'assets/images/logo_cooking.png',
                                        ),
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        'Định Trọng Phúc',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                    ),
                  ),
                  const Text(
                    'Nguyên liệu',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 2,
                    children: List.generate(
                      6,
                      (index) => Chip(
                        label: Text('Danh mục ${index + 1}'),
                        backgroundColor: Colors.grey.shade200,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),

              // TP. HCM Section
            ],
          ),
        ),
      ),
    );
  }
}
