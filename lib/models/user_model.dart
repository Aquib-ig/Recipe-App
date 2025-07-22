import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String fullName;
  final String? imageUrl;
  final String email;
  final Timestamp timestamp;

  UserModel({
    required this.fullName,
    this.imageUrl,
    required this.email,
    required this.timestamp,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullName: json["fullName"] ?? "",
      imageUrl: json["imageUrl"] ?? "",
      email: json["email"] ?? "",
      timestamp: json["timestamp"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "fullName": fullName,
      "imageUrl": imageUrl,
      "email": email,
      "timestamp": timestamp,
    };
  }
}
