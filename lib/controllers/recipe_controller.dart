import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/utils/app_logger_helper.dart';
class RecipeController extends ChangeNotifier {
  final String baseUrl = "https://dummyjson.com/recipes?limit=0";

  List<Recipe> recipes = [];             // full fetched list
  List<Recipe> filteredRecipes = [];    // after search
  List<Recipe> categoryRecipes = [];    // after category

  bool isLoading = false;
  Timer? _debounce;

  RecipeController() {
    loadCachedRecipes();
    fetchRecipes();
  }

  Future<void> loadCachedRecipes() async {
    final box = Hive.box<Recipe>("recipesBox");
    recipes = box.values.toList();
    filteredRecipes = List.from(recipes);
    categoryRecipes = List.from(recipes);
    notifyListeners();
  }

  Future<void> fetchRecipes() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonString = jsonDecode(response.body);
        final List<dynamic> data = jsonString["recipes"];
        recipes = data.map((item) => Recipe.fromJson(item)).toList();

        final box = Hive.box<Recipe>("recipesBox");
        await box.clear();
        await box.addAll(recipes);

        filteredRecipes = List.from(recipes);
        categoryRecipes = List.from(recipes);
      } else {
        throw Exception("Failed to load recipes");
      }
    } catch (e, stackTrace) {
      AppLoggerHelper.error("Error fetching recipes", e, stackTrace);
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void searchRecipes(String query) {
    _debounce?.cancel();
    _debounce = Timer(Duration(milliseconds: 400), () {
      if (query.isEmpty) {
        filteredRecipes = List.from(recipes);
      } else {
        filteredRecipes = recipes.where((e) {
          return e.name?.toLowerCase().contains(query.toLowerCase()) ?? false;
        }).toList();
      }
      notifyListeners();
    });
  }

 void filterByCategory(String category) {
  if (category == 'All') {
    categoryRecipes = List.from(recipes);
  } else {
    categoryRecipes = recipes.where((recipe) {
      return recipe.mealType?.any(
        (type) => type.toLowerCase() == category.toLowerCase()
      ) ?? false;
    }).toList();
  }
  notifyListeners();
}

}
