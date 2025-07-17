import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/controllers/favorite_controller.dart';
import 'package:recipe_app/controllers/recipe_controller.dart';
import 'package:recipe_app/screens/app_screens/recipe_detail_screen.dart';
import 'package:recipe_app/widgets/custom_tile.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final recipeController = context.watch<RecipeController>();
    final favoriteController = context.watch<FavoriteController>();
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  Icon(Icons.category, size: 40),
                  Spacer(),
                  CircleAvatar(backgroundColor: Color(0xfff2680d), radius: 30),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hey Aquib!",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),

                  Text(
                    "What are you cooking today?",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 10),

                  TextField(
                    onChanged: (query) {
                      recipeController.searchRecipes(query);
                    },
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search_outlined),
                      hintText: 'Search recipes…',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                  ),
                ],
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
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    RecipeDetailScreen(recipe: recipe),
                              ),
                            );
                          },
                          recipeImage: recipe.image ?? "",
                          recipename: recipe.name ?? "",
                          prepTime: recipe.prepTimeMinutes.toString(),
                          cookTime: recipe.cookTimeMinutes.toString(),
                          recipeRatings: recipe.rating.toString(),
                          reviews: recipe.reviewCount.toString(),
                          isFavorite: favoriteController.isFavorite(recipe),
                          onFavoriteTap: () {
                            favoriteController.toggleFavorite(recipe);
                            final isNowFavorite = favoriteController.isFavorite(
                              recipe,
                            );
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(
                                SnackBar(
                                  duration: Duration(seconds: 1),
                                  content: Text(
                                    isNowFavorite
                                        ? "Recipe removed from favorites"
                                        : "Recipe added to favorites",
                                  ),
                                ),
                              );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
