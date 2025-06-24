import 'dart:convert';
import 'package:cooking_app/models/hive_meal_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeSearch extends StatefulWidget {
  const HomeSearch({super.key});

  @override
  State<HomeSearch> createState() => _HomeSearchState();
}

class _HomeSearchState extends State<HomeSearch> {
  final TextEditingController _searchController = TextEditingController();
  List<MealModel> _searchResults = [];
  bool isLoading = false;

  Future<void> _searchMeals(String query) async {
    if (query.isEmpty) {
      setState(() => _searchResults.clear());
      return;
    }

    setState(() => isLoading = true);

    final url = Uri.parse(
      'https://www.themealdb.com/api/json/v1/1/search.php?s=$query',
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final meals = data['meals'];

      if (meals != null) {
        setState(() {
          _searchResults = List<MealModel>.from(
            meals.map((e) => MealModel.fromJson(e)),
          );
        });
      } else {
        setState(() => _searchResults.clear());
      }
    }

    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      _searchMeals(_searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search box
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              icon: Icon(Icons.search),
              border: InputBorder.none,
              hintText: 'Tìm kiếm sản phẩm',
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Hiển thị kết quả
        if (_searchController.text.isNotEmpty)
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xffe5e3e3),
              borderRadius: BorderRadius.circular(10),
            ),
            child:
                isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : _searchResults.isEmpty
                    ? const Text('Không tìm thấy món ăn')
                    : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _searchResults.length,
                      itemBuilder: (_, index) {
                        final meal = _searchResults[index];
                        return ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 8),
                          title: Text(
                            meal.title,
                            style: TextStyle(fontSize: 16),
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Color(0xffCEA700),
                          ),
                          onTap: () {
                            Get.snackbar(
                              'Thông báo',
                              'Bạn đã chọn: ${meal.title}',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.orange,
                              colorText: Colors.white,
                            );
                          },
                        );
                      },
                    ),
          ),
      ],
    );
  }
}
