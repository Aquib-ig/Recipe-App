// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_recipe_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteRecipeModelAdapter extends TypeAdapter<FavoriteRecipeModel> {
  @override
  final int typeId = 2;

  @override
  FavoriteRecipeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteRecipeModel(
      recipe: fields[0] as Recipe,
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteRecipeModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.recipe);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteRecipeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
