import 'package:flutter/material.dart';
import 'package:sample_flutter/home/index.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(bloc: HomeBloc(provider:  HomeProvider())),
    );
  }
}
