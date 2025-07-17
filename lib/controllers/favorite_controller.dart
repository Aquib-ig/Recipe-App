import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:recipe_app/models/recipe_model.dart';

class FavoriteController extends ChangeNotifier {
  List<Recipe> favoriteRecipes = [];

  FavoriteController() {
    loadFavorites();
  }

  void loadFavorites() {
    final box = Hive.box<Recipe>('favoritesBox');
    favoriteRecipes = box.values.toList();
    notifyListeners();
  }

  Future<void> addFavorite(Recipe recipe) async {
    final box = Hive.box<Recipe>('favoritesBox');
    final index = favoriteRecipes.indexWhere((r) => r.id == recipe.id);
    if (index == -1) {
      await box.add(recipe);
      favoriteRecipes = box.values.toList();
      notifyListeners();
    }
  }

  Future<void> removeFavorite(Recipe recipe) async {
    final box = Hive.box<Recipe>('favoritesBox');
    final index = favoriteRecipes.indexWhere((r) => r.id == recipe.id);
    if (index != -1) {
      await box.deleteAt(index);
      favoriteRecipes = box.values.toList();
      notifyListeners();
    }
  }

  Future<void> toggleFavorite(Recipe recipe) async {
    final box = Hive.box<Recipe>('favoritesBox');
    final index = favoriteRecipes.indexWhere((r) => r.id == recipe.id);

    if (index != -1) {
      // if already exists → remove
      await box.deleteAt(index);
    } else {
      // if not exists → add
      await box.add(recipe);
    }

    favoriteRecipes = box.values.toList();
    notifyListeners();
  }

  bool isFavorite(Recipe recipe) {
    final index = favoriteRecipes.indexWhere((r) => r.id == recipe.id);
    return index != -1;
  }
}
