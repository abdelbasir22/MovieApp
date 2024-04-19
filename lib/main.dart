import 'package:flutter/material.dart';
import 'package:movie_app/features/home/presentation/view/home_view.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomeView(),
    );
  }
}
