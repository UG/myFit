import "package:uuid/uuid.dart";

class Food {
  String id;
  String name;
  int bookmark;
  // macro
  double calories;
  double protein;
  double carbo;
  double fat;
  double fiber;
  assignUUID() {
    id = Uuid().v4();
  }

  Food(
      {this.id = "",
      required this.name,
      this.bookmark = 0,
      this.calories = 0.0,
      this.protein = 0.0,
      this.fat = 0.0,
      this.carbo = 0.0,
      this.fiber = 0.0});

  factory Food.fromMap(Map<String, dynamic> json) => Food(
      id: json["id"],
      name: json["name"],
      bookmark: json["bookmark"],
      calories: json["calories"],
      protein: json["protein"],
      fat: json["fat"],
      carbo: json["carbo"],
      fiber: json["fiber"]);

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "bookmark": bookmark,
        "calories": calories,
        "protein": protein,
        "fat": fat,
        "carbo": carbo,
        "fiber": fiber
      };
}
