import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/controllers/favorite_controller.dart';
import 'package:recipe_app/screens/app_screens/recipe_detail_screen.dart';
import 'package:recipe_app/widgets/favorite_tile.dart';

class FavoriteRecipeScreen extends StatelessWidget {
  const FavoriteRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteController = context.watch<FavoriteController>();
    final favorites = favoriteController.favoriteRecipes;

    return Scaffold(
      appBar: AppBar(title: const Text("Favorites")),
      body: favorites.isEmpty
          ? const Center(child: Text("No favorites yet"))
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final recipe = favorites[index];
                return FavoriteTile(
                  recipe: recipe,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => RecipeDetailScreen(recipe: recipe),
                      ),
                    );
                  },
                  onFavoriteTap: () {
                    favoriteController.toggleFavorite(recipe);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Recipe removed from favorites"),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
