import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/controllers/recipe_controller.dart';
import 'package:recipe_app/widgets/custom_tile.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final recipeController = context.watch<RecipeController>();
    return Scaffold(
      appBar: AppBar(title: Text("All Recipes")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: TextField(
              onChanged: (query) {
                recipeController.searchRecipes(query);
              },
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.search_outlined),
                hintText: 'Search recipes…',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          Expanded(
            child: recipeController.isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: recipeController.recipes.length,
                    itemBuilder: (context, index) {
                      final recipe = recipeController.recipes[index];
                      return CustomTile(
                        recipeImage: recipe.image ?? "",
                        recipename: recipe.name ?? "",
                        prepTime: recipe.prepTimeMinutes.toString(),
                        cookTime: recipe.cookTimeMinutes.toString(),
                        recipeRatings: recipe.rating.toString(),
                        reviews: recipe.reviewCount.toString(),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
