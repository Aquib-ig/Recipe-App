import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe_model.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;
  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Stack(
            children: [
              SizedBox(
                height: 400,
                width: double.infinity,
                child: CachedNetworkImage(
                  width: double.infinity,
                  fit: BoxFit.cover,
                  imageUrl: recipe.image ?? "",
                  errorWidget: (context, url, error) => Icon(Icons.error),

                  placeholder: (context, url) {
                    return Center(
                      child: SizedBox(
                        height: 35,
                        width: 35,
                        child: CircularProgressIndicator(strokeWidth: 3),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                top: 25,
                left: 15,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white70,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 350,
                left: 0,
                right: 0,
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Opacity(
                    opacity: 0.9,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xff130f0c),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: DefaultTabController(
                        length: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              recipe.name ?? "",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  "Servings: ${recipe.servings ?? " "}",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.access_time_rounded,
                                  color: Color(0xfff2680d),
                                  size: 22,
                                ),
                                Text(
                                  "${recipe.prepTimeMinutes} - ",
                                  style: TextStyle(fontSize: 15),
                                ),
                                Text(
                                  "${recipe.cookTimeMinutes} min",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),

                            // TabBar
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: TabBar(
                                labelColor: Colors.white,
                                unselectedLabelColor: Colors.white70,
                                indicator: BoxDecoration(
                                  color: Color(0xfff2680d),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                indicatorSize: TabBarIndicatorSize.tab,
                                dividerColor: Colors.transparent,
                                labelStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                                tabs: const [
                                  Tab(text: "Ingredients"),
                                  Tab(text: "Instructions"),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Expanded(
                              child: TabBarView(
                                physics: ScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics(),
                                ),
                                children: [
                                  // Ingredients Tab
                                  ListView.builder(
                                    itemCount: recipe.ingredients?.length ?? 0,
                                    itemBuilder: (context, index) {
                                      final ingredient =
                                          recipe.ingredients![index];
                                      return ListTile(
                                        leading: CircleAvatar(
                                          backgroundColor: Colors.white24,
                                          radius: 14,
                                          child: Text(
                                            "${index + 1}",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        title: Text(
                                          ingredient,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      );
                                    },
                                  ),

                                  // Instructions Tab
                                  ListView.builder(
                                    itemCount: recipe.instructions?.length ?? 0,
                                    itemBuilder: (context, index) {
                                      final instruction =
                                          recipe.instructions![index];
                                      return ListTile(
                                        leading: CircleAvatar(
                                          backgroundColor: Colors.white24,
                                          radius: 14,
                                          child: Text(
                                            "${index + 1}",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        title: Text(
                                          instruction,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Color(0xfff2680d),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              "Start Cooking",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
