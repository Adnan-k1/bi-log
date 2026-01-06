import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bi_log/blog/calculator_bloc.dart';
import 'package:bi_log/pages/calculator_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator BLoC',
      home: BlocProvider(
        create: (_) => CalculatorBloc(),
        child: const CalculatorPage(),
      ),
    );
  }
}
