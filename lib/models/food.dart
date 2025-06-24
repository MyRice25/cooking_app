class Food {
  final String id;
  final String name;
  final String imageUrl;
  final String category;

  Food({required this.id, required this.name, required this.imageUrl, required this.category});

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      imageUrl: json['image'] ?? '',
      category: json['category'] ?? '',
    );
  }
}