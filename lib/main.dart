import 'package:flutter/material.dart';
import 'package:osta_quiz_app/routes/categories_page.dart';
import 'package:osta_quiz_app/routes/login_Page.dart';
import 'package:osta_quiz_app/routes/opening_page.dart';
import 'package:osta_quiz_app/routes/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: OpeningPage.id,
      routes: {
        OpeningPage.id: (context) => const OpeningPage(),
        LoginPage.id: (context) => LoginPage(),
        SignUpPage.id: (context) => SignUpPage(),
        CategoriesPage.id: (context) => const CategoriesPage(),
      },
    );
  }
}
