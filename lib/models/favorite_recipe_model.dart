import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipe_app/models/recipe_model.dart';

part 'favorite_recipe_model.g.dart';

@HiveType(typeId: 2)
class FavoriteRecipeModel {
  @HiveField(0)
  final Recipe recipe;

  FavoriteRecipeModel({required this.recipe});

  factory FavoriteRecipeModel.fromJson(Map<String, dynamic> json) {
    return FavoriteRecipeModel(recipe: Recipe.fromJson(json["resipe"]));
  }

  Map<String, dynamic> toJson() {
    return {"recipe": recipe.toJson()};
  }
}
