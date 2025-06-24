import 'package:cooking_app/models/food.dart';
import 'package:cooking_app/services/api_service.dart';
import 'package:get/get.dart';


// class FoodController extends GetxController {
//   var foodList = <Food>[].obs;
//   var isLoading = false.obs;

//   @override
//   void onInit() {
//     fetchFoodList();
//     super.onInit();
//   }

//   void fetchFoodList() async {
//     isLoading.value = true;
//     try {
//       var result = await ApiService.fetchMeals();
//       foodList.assignAll(result);
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }