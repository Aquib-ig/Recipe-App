import 'package:flutter/material.dart';

class AddRecipeScreen extends StatelessWidget {
  const AddRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Want to add your own recipe and share with everyont? Click on the add button to add your first recipe!",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(12),
          child: Container(
            width: 130,
            decoration: BoxDecoration(
              color: Color(0xfff2680d),
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Add recipe"), Icon(Icons.add)],
            ),
          ),
        ),
      ),
    );
  }
}
