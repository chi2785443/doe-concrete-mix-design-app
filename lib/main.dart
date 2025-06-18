import 'package:doe_concrete_mix_desiger/features/doe/presentation/pages/calculate_page.dart';
import 'package:flutter/material.dart';
import 'features/doe/presentation/pages/input_page.dart';
import 'features/manual/presentation/pages/manual_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DoE design',
      home: const ManualPage(),
      routes: {
        'input_page': (context) => const InputPage(),
        'calculation_page': (context) => const CalculatePage()
      },
    );
  }
}
