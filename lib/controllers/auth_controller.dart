import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/models/user_model.dart';

class AuthController extends ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  bool _isLoading = false;

  User? get currentUser => _auth.currentUser;
  bool get isLoading => _isLoading;

  Future<UserCredential?> signUp(
    String fullName,
    String email,
    String password,
  ) async {
    try {
      _isLoading = true;
      notifyListeners();
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      UserModel user = UserModel(
        fullName: fullName,
        imageUrl: null,
        email: email,
        timestamp: Timestamp.now(),
      );

      await _firestore
          .collection("users")
          .doc(userCredential.user!.uid)
          .set(user.toJson());

      notifyListeners();
      return userCredential;
    } on FirebaseAuthException catch (e) {
      log("Failed to signup ${e.toString()}");
      rethrow;
    } catch (e) {
      log(e.toString());
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<UserCredential?> signIn(String email, String password) async {
    try {
      _isLoading = true;
      notifyListeners();
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      notifyListeners();
      return userCredential;
    } on FirebaseAuthException catch (e) {
      log("Failed to login ${e.toString()}");
      rethrow;
    } catch (e) {
      log(e.toString());
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    currentUser == null;
    notifyListeners();
  }
}
