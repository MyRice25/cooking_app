class Meal {
  final String id;
  final String name;
  final String byTitle;
  final String time;
  final String thumbnail;
  final String instructions; // cách chế biến
  final String ingredients; // nguyên liệu dạng

  Meal({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.byTitle,
    required this.time,
    this.instructions = '',
    this.ingredients = '',
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['idMeal'],
      name: json['strMeal'],
      byTitle: json['strMealbyTitle'],
      time: json['strMealTime'],
      thumbnail: json['strMealThumb'],
      instructions: json['strInstructions'] ?? '',
      ingredients: _parseIngredients(json),
    );
  }

  static String _parseIngredients(Map<String, dynamic> json) {
    final buffer = StringBuffer();
    for (int i = 1; i <= 20; i++) {
      final ingredient = json['strIngredient$i'];
      final measure = json['strMeasure$i'];
      if (ingredient != null && ingredient.toString().trim().isNotEmpty) {
        buffer.writeln("• $measure $ingredient");
      }
    }
    return buffer.toString();
  }
}
