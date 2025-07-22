import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/controllers/auth_controller.dart';
import 'package:recipe_app/controllers/favorite_controller.dart';
import 'package:recipe_app/controllers/recipe_controller.dart';
import 'package:recipe_app/controllers/theme_controller.dart';
import 'package:recipe_app/config/firebase_options.dart';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/screens/auth_screens/auth_gate.dart';
import 'package:recipe_app/themes/theme.dart';
import 'package:recipe_app/utils/app_logger_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  Hive.registerAdapter(RecipeAdapter());
  await Hive.openBox<Recipe>("recipesBox");
  await Hive.openBox<Recipe>("favoritesBox");
  AppLoggerHelper.initialize();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => RecipeController()),
        ChangeNotifierProvider(create: (_) => ThemeController()),
        ChangeNotifierProvider(create: (_) => FavoriteController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final themeController = Provider.of<ThemeController>(context);
    return MaterialApp(
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: themeController.themeMode,
      home: AuthGate(),
    );
  }
}
