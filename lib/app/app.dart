import 'package:crossword_pal/app/router.dart';
import 'package:flutter/material.dart';

class CrosswordCrackerApp extends StatelessWidget {
  CrosswordCrackerApp({
    super.key,
  });

  final router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router.router,
      title: 'Flutter Demo',
      color: const Color(0xFF7CB9E8),
    );
  }
}
