import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/utils/app_logger_helper.dart';

class RecipeController extends ChangeNotifier {
  final String baseUrl = "https://dummyjson.com/recipes?limit=0";
  List<Recipe> recipes = [];
  List<Recipe> filteredRecipes = [];
  bool isLoading = false;

  Timer? timer;

  RecipeController() {
    loadCachedRecipes();
    fetchRecipes();
  }

  Future<void> loadCachedRecipes() async {
    final box = Hive.box<Recipe>("recipesBox");
    recipes = box.values.toList();
    filteredRecipes = List.from(recipes);
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
        filteredRecipes = List.from(recipes);

        // Save to hive
        final box = Hive.box<Recipe>("recipesBox");
        await box.clear(); // Clear old data
        await box.addAll(recipes);
      } else {
        throw Exception("Failed to load recipes");
      }
    } catch (e, stackTrace) {
      AppLoggerHelper.error("Error fatching recipes", e, stackTrace);
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void searchRecipes(String query) {
    timer?.cancel();

    timer = Timer(Duration(milliseconds: 500), () {
      if (query.isEmpty) {
        recipes = filteredRecipes;
      } else {
        recipes = filteredRecipes
            .where(
              (e) =>
                  e.name?.toLowerCase().contains(query.toLowerCase()) ?? false,
            )
            .toList();
      }
      notifyListeners();
    });
  }
}
