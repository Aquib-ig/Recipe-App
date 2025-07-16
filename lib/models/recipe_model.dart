// To parse this JSON data, do
//
//     final recipe = recipeFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';

part 'recipe_model.g.dart'; 

Recipe recipeFromJson(String str) => Recipe.fromJson(json.decode(str));

String recipeToJson(Recipe data) => json.encode(data.toJson());

@HiveType(typeId: 0)
class Recipe {
  @HiveField(1)
  final int? id;
  @HiveField(2)
  final String? name;
  @HiveField(3)
  final List<String>? ingredients;
  @HiveField(4)
  final List<String>? instructions;
  @HiveField(5)
  final int? prepTimeMinutes;
  @HiveField(6)
  final int? cookTimeMinutes;
  @HiveField(7)
  final int? servings;
  @HiveField(8)
  final String? difficulty;
  @HiveField(9)
  final String? cuisine;
  @HiveField(10)
  final int? caloriesPerServing;
  @HiveField(11)
  final List<String>? tags;
  @HiveField(12)
  final int? userId;
  @HiveField(13)
  final String? image;
  @HiveField(14)
  final double? rating;
  @HiveField(15)
  final int? reviewCount;
  @HiveField(16)
  final List<String>? mealType;

  Recipe({
    this.id,
    this.name,
    this.ingredients,
    this.instructions,
    this.prepTimeMinutes,
    this.cookTimeMinutes,
    this.servings,
    this.difficulty,
    this.cuisine,
    this.caloriesPerServing,
    this.tags,
    this.userId,
    this.image,
    this.rating,
    this.reviewCount,
    this.mealType,
  });

  Recipe copyWith({
    int? id,
    String? name,
    List<String>? ingredients,
    List<String>? instructions,
    int? prepTimeMinutes,
    int? cookTimeMinutes,
    int? servings,
    String? difficulty,
    String? cuisine,
    int? caloriesPerServing,
    List<String>? tags,
    int? userId,
    String? image,
    double? rating,
    int? reviewCount,
    List<String>? mealType,
  }) => Recipe(
    id: id ?? this.id,
    name: name ?? this.name,
    ingredients: ingredients ?? this.ingredients,
    instructions: instructions ?? this.instructions,
    prepTimeMinutes: prepTimeMinutes ?? this.prepTimeMinutes,
    cookTimeMinutes: cookTimeMinutes ?? this.cookTimeMinutes,
    servings: servings ?? this.servings,
    difficulty: difficulty ?? this.difficulty,
    cuisine: cuisine ?? this.cuisine,
    caloriesPerServing: caloriesPerServing ?? this.caloriesPerServing,
    tags: tags ?? this.tags,
    userId: userId ?? this.userId,
    image: image ?? this.image,
    rating: rating ?? this.rating,
    reviewCount: reviewCount ?? this.reviewCount,
    mealType: mealType ?? this.mealType,
  );

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
    id: json["id"],
    name: json["name"],
    ingredients: json["ingredients"] == null
        ? []
        : List<String>.from(json["ingredients"]!.map((x) => x)),
    instructions: json["instructions"] == null
        ? []
        : List<String>.from(json["instructions"]!.map((x) => x)),
    prepTimeMinutes: json["prepTimeMinutes"],
    cookTimeMinutes: json["cookTimeMinutes"],
    servings: json["servings"],
    difficulty: json["difficulty"],
    cuisine: json["cuisine"],
    caloriesPerServing: json["caloriesPerServing"],
    tags: json["tags"] == null
        ? []
        : List<String>.from(json["tags"]!.map((x) => x)),
    userId: json["userId"],
    image: json["image"],
    rating: json["rating"]?.toDouble(),
    reviewCount: json["reviewCount"],
    mealType: json["mealType"] == null
        ? []
        : List<String>.from(json["mealType"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "ingredients": ingredients == null
        ? []
        : List<dynamic>.from(ingredients!.map((x) => x)),
    "instructions": instructions == null
        ? []
        : List<dynamic>.from(instructions!.map((x) => x)),
    "prepTimeMinutes": prepTimeMinutes,
    "cookTimeMinutes": cookTimeMinutes,
    "servings": servings,
    "difficulty": difficulty,
    "cuisine": cuisine,
    "caloriesPerServing": caloriesPerServing,
    "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
    "userId": userId,
    "image": image,
    "rating": rating,
    "reviewCount": reviewCount,
    "mealType": mealType == null
        ? []
        : List<dynamic>.from(mealType!.map((x) => x)),
  };
}
