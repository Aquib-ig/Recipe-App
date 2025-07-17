import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:recipe_app/models/recipe_model.dart';

class FavoriteTile extends StatelessWidget {
  final Recipe recipe;
  final VoidCallback onTap;
  final VoidCallback onFavoriteTap;

  const FavoriteTile({
    super.key,
    required this.recipe,
    required this.onTap,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 36, 29, 23),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: recipe.image ?? "",
                height: 100,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  height: 35,
                  width: 35,
                  color: Color(0xfff2680d),
                  child: Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
                errorWidget: (context, url, error) =>
                    Icon(Icons.error, size: 40),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.name ?? "",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time_rounded,
                        size: 16,
                        color: Color(0xfff2680d),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "${recipe.prepTimeMinutes ?? 0} - ${recipe.cookTimeMinutes ?? 0} min",
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      RatingBarIndicator(
                        rating: recipe.rating?.toDouble() ?? 0.0,
                        itemBuilder: (context, index) =>
                            const Icon(Icons.star, color: Color(0xfff2680d)),
                        itemSize: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        recipe.rating?.toStringAsFixed(1) ?? "0",
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "(${recipe.reviewCount ?? 0} reviews)",
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: onFavoriteTap,
              icon: const Icon(Icons.favorite, color: Color(0xfff2680d)),
            ),
          ],
        ),
      ),
    );
  }
}
