import 'package:flutter/material.dart';
import 'package:cooking_app/models/hive_meal_model.dart';

class DetailScreen extends StatefulWidget {
  final MealModel meal;

  const DetailScreen({super.key, required this.meal});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final meal = widget.meal;

    return Scaffold(
      backgroundColor: const Color(0xfff7f7f7),
      body: DefaultTabController(
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ảnh chính
            Stack(
              children: [
                Image.asset(
                  meal.image,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 32,
                  left: 4,
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 24,
                          color: Colors.white,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text(
                        'Chi tiết',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Slider ảnh nhỏ
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemCount: 6,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        meal.image,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            // Tiêu đề
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        meal.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.favorite_border),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Cách chiên trứng một cách cung phu',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.amber),
                      SizedBox(width: 4),
                      Text("4.2"),
                      SizedBox(width: 8),
                      Text("|"),
                      SizedBox(width: 8),
                      Text("120 đánh giá"),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      CircleAvatar(
                        radius: 14,
                        backgroundImage: AssetImage('assets/images/cook.png'),
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
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 1,
                    color: const Color(0xffCEA700),
                    margin: const EdgeInsets.only(bottom: 32),
                  ),
                  // Tab Bar
                  TabBar(
                    controller: _tabController,
                    labelColor: Colors.white,
                    unselectedLabelColor: const Color(0xffCEA700),
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xffCEA700),
                    ),
                    tabs: const [
                      Tab(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Text('Nguyên liệu'),
                        ),
                      ),
                      Tab(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Text('Chế biến'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Nội dung
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Nguyên liệu
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: ListView(
                      children: [
                        const Text(
                          'Dành cho 2–4 người ăn',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text("300g chân gà, luộc trong 20 phút"),
                        Text("2 chiếc xúc xích bò"),
                        Text("5 viên thịt bò"),
                        Text("100g bánh sắn, luộc cho đến khi mềm"),
                        Text("1 quả trứng đánh tan"),
                        Text("50 cải xanh, cắt thành 4 miếng"),
                        SizedBox(height: 12),
                        Text(
                          'Đối với bột gia vị',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text("15g tỏi"),
                        Text("30g hành tím"),
                        Text("50g đường nâu"),
                        Text("25g dầu ăn"),
                      ],
                    ),
                  ),
                  // Chế biến
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text("Cách chế biến đang cập nhật..."),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Tính năng xem video đang phát triển'),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffFFF6D5),
                  minimumSize: const Size.fromHeight(48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                ),
                icon: const Icon(
                  Icons.play_circle_fill,
                  color: Color(0xffCEA700),
                ),
                label: const Text(
                  'Xem video',
                  style: TextStyle(
                    color: Color(0xffCEA700),
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    // Nút xem video
  }
}
