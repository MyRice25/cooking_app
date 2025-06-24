import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../models/hive_meal_model.dart';

class FavoriteController extends GetxController {
  final favoritesBox = Hive.box<MealModel>('favorites');
  RxList<MealModel> favorites = <MealModel>[].obs;

  @override
  void onInit() {
    favorites.value = favoritesBox.values.toList();
    super.onInit();
  }

  void toggleFavorite(MealModel meal) {
    final exists = favorites.any((e) => e.id == meal.id);

    if (exists) {
      // Xoá khỏi danh sách tạm thời trước
      favorites.removeWhere((e) => e.id == meal.id);

      // Xoá Hive sau
      final key = favoritesBox.keys.firstWhere(
        (k) => favoritesBox.get(k)!.id == meal.id,
        orElse: () => null,
      );
      if (key != null) favoritesBox.delete(key);
    } else {
      // Thêm vào danh sách UI trước
      favorites.add(meal);

      // Thêm vào Hive sau
      favoritesBox.add(meal);
    }
  }

  bool isFavorite(String id) {
    return favorites.any((e) => e.id == id);
  }
}
