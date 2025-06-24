import 'dart:async';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchControl extends GetxController {
  var searchQuery = ''.obs;
  var searchResults = [].obs;
  var isLoading = false.obs;
  var history = <String>[].obs;

  Timer? _debounce;

  // Khi người dùng gõ tìm kiếm
  void onSearchChanged(String query) {
    searchQuery.value = query;

    // Debounce: đợi người dùng ngưng gõ 200ms mới gọi API
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 200), () {
      if (query.isNotEmpty) {
        history.remove(query); // Xóa nếu trùng
        history.insert(0, query); // Thêm lên đầu
        if (history.length > 4) {
          history.removeLast();
        }
        fetchResults(query); // Gọi API
      }
    });
  }

  // Gọi API từ themealdb
  Future<void> fetchResults(String query) async {
    isLoading.value = true;
    final url = Uri.parse(
      'https://www.themealdb.com/api/json/v1/1/search.php?s=$query',
    );
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        searchResults.value = data['meals'] ?? [];
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
