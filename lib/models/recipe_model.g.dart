// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeAdapter extends TypeAdapter<Recipe> {
  @override
  final int typeId = 0;

  @override
  Recipe read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Recipe(
      id: fields[1] as int?,
      name: fields[2] as String?,
      prepTimeMinutes: fields[5] as int?,
      cookTimeMinutes: fields[6] as int?,
      servings: fields[7] as int?,
      difficulty: fields[8] as String?,
      cuisine: fields[9] as String?,
      caloriesPerServing: fields[10] as int?,
      userId: fields[12] as int?,
      image: fields[13] as String?,
      rating: fields[14] as double?,
      reviewCount: fields[15] as int?,
      ingredients: (fields[3] as List).cast<String>(),
      instructions: (fields[4] as List).cast<String>(),
      tags: (fields[11] as List).cast<String>(),
      mealType: (fields[16] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Recipe obj) {
    writer
      ..writeByte(16)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.ingredients)
      ..writeByte(4)
      ..write(obj.instructions)
      ..writeByte(5)
      ..write(obj.prepTimeMinutes)
      ..writeByte(6)
      ..write(obj.cookTimeMinutes)
      ..writeByte(7)
      ..write(obj.servings)
      ..writeByte(8)
      ..write(obj.difficulty)
      ..writeByte(9)
      ..write(obj.cuisine)
      ..writeByte(10)
      ..write(obj.caloriesPerServing)
      ..writeByte(11)
      ..write(obj.tags)
      ..writeByte(12)
      ..write(obj.userId)
      ..writeByte(13)
      ..write(obj.image)
      ..writeByte(14)
      ..write(obj.rating)
      ..writeByte(15)
      ..write(obj.reviewCount)
      ..writeByte(16)
      ..write(obj.mealType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
