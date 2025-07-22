import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/controllers/auth_controller.dart';
import 'package:recipe_app/screens/app_screens/home_screen.dart';
import 'package:recipe_app/screens/auth_screens/signup_screen.dart';
import 'package:recipe_app/utils/validation.dart';
import 'package:recipe_app/widgets/app_button.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SigninScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _passwordVisible = true;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthController>();
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double maxWidth = constraints.maxWidth > 600 ? 500 : double.infinity;
          double maxHeight = MediaQuery.of(context).size.height;
          return SingleChildScrollView(
            child: SizedBox(
              width: maxWidth,
              height: maxHeight,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Welcome Back!",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Sign in to discover and save your favorite recipes.",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      const SizedBox(height: 20),

                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          hintText: "Enter your email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                          ),
                        ),
                        validator: (value) => Validation.validateEmail(value),
                      ),
                      const SizedBox(height: 20),

                      TextFormField(
                        controller: _passwordController,
                        obscureText: _passwordVisible,
                        decoration: InputDecoration(
                          hintText: "Enter your password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                        ),
                        validator: (value) =>
                            Validation.validatePassword(value),
                      ),
                      const SizedBox(height: 20),

                      AppButton(
                        onTap: auth.isLoading
                            ? null
                            : () async {
                                if (_formKey.currentState!.validate()) {
                                  try {
                                    final user = await auth.signIn(
                                      _emailController.text.trim(),
                                      _passwordController.text.trim(),
                                    );

                                    if (user != null) {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => HomeScreen(),
                                        ),
                                      );
                                    }

                                    _emailController.clear();
                                    _passwordController.clear();
                                  } on FirebaseAuthException catch (e) {
                                    log("Login error: ${e.message}");
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          e.message ?? "Login failed",
                                        ),
                                      ),
                                    );
                                  } catch (e) {
                                    log("Unknown error: $e");
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Something went wrong"),
                                      ),
                                    );
                                  }
                                }
                              },
                        child: auth.isLoading
                            ? SizedBox(
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              )
                            : Center(
                              child: Text(
                                  "Signin",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                            ),
                      ),

                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          children: [
                            Expanded(child: Divider()),
                            SizedBox(width: 10),
                            Text("or"),
                            SizedBox(width: 10),
                            Expanded(child: Divider()),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),

                      Text("Sign in with", style: TextStyle(fontSize: 18)),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundColor: Theme.of(
                                context,
                              ).colorScheme.surface,
                              radius: 20,
                              child: Image.asset(
                                height: 20,
                                "assets/images/google.png",
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Theme.of(
                                context,
                              ).colorScheme.surface,
                              child: Image.asset(
                                height: 24,
                                "assets/images/facebook.png",
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),

                      RichText(
                        text: TextSpan(
                          text: "Don't have an account?  ",
                          style: Theme.of(context).textTheme.bodyMedium,

                          children: [
                            TextSpan(
                              text: "Signup",
                              style: const TextStyle(
                                color: Color(0xfff2680d),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignupScreen(),
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
          );
        },
      ),
    );
  }
}
