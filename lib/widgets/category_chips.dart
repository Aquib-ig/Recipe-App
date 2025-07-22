import 'package:flutter/material.dart';

class CategoryChips extends StatefulWidget {
  final ValueChanged<String> onCategorySelected;

  const CategoryChips({super.key, required this.onCategorySelected});

  @override
  State<CategoryChips> createState() => _CategoryChipsState();
}

class _CategoryChipsState extends State<CategoryChips> {
  String selectedCategory = "All";

  final categories = ["All", "Breakfast", "Lunch", "Dinner"];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
      
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => SizedBox(width: 16),
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = category == selectedCategory;

          return ChoiceChip(
            label: Text(category),
            selected: isSelected,
            selectedColor: Color(0xfff2680d),
            onSelected: (_) {
              setState(() {
                selectedCategory = category;
              });
              widget.onCategorySelected(category);
            },
          );
        },
      ),
    );
  }
}
