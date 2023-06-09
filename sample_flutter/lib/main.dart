import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_flutter/home/index.dart';
import 'package:sample_flutter/setting/navigation_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(create: (_)=> NavigationBloc(),
      child: HomePage(bloc: HomeBloc(provider:  HomeProvider())),
      ),
    );
  }
}
