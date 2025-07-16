import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomTile extends StatelessWidget {
  final String recipeImage;
  final String recipename;
  final String prepTime;
  final String cookTime;
  final String recipeRatings;
  final String reviews;
  const CustomTile({
    super.key,
    required this.recipeImage,
    required this.recipename,
    required this.recipeRatings,
    required this.reviews,
    required this.cookTime,
    required this.prepTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 16),
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 36, 29, 23),
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.center,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(20),
                  child: SizedBox(
                    height: 200,
                    child: CachedNetworkImage(
                      width: double.infinity,
                      fit: BoxFit.cover,
                      imageUrl: recipeImage,
                      placeholder: (context, url) => Center(
                        child: SizedBox(
                          height: 35,
                          width: 35,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            color: Color(0xfff2680d),
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite, color: Color(0xfff2680d)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  recipename,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Icon(
                  Icons.access_time_rounded,
                  color: Color(0xfff2680d),
                  size: 22,
                ),
                Text("$prepTime - ", style: TextStyle(fontSize: 15)),
                Text("$cookTime min", style: TextStyle(fontSize: 15)),
              ],
            ),
            SizedBox(height: 10),

            Row(
              children: [
                RatingBarIndicator(
                  rating: double.parse(recipeRatings),
                  itemBuilder: (context, index) =>
                      Icon(Icons.star, color: Color(0xfff2680d)),
                  itemCount: 5,
                  itemSize: 20,
                ),
                SizedBox(width: 10),

                Text(recipeRatings, style: TextStyle(fontSize: 15)),
                SizedBox(width: 10),
                Text(
                  "(${reviews.toString()} Reviews)",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
