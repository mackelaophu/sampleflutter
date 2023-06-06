import 'package:flutter/material.dart';
import 'package:sample_flutter/home/index.dart';


class HomePage extends StatefulWidget {
  const HomePage({
    required this.bloc,
    super.key
    });
  static const String routeName = '/home';
  
  final HomeBloc bloc;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home'),
         actions: [
          IconButton(
            icon: const Icon(Icons.error),
            onPressed: () {
              widget.bloc.add(ErrorYouAwesomeEvent());
            },
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              widget.bloc.add(AddHomeEvent());
            },
          ),
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              widget.bloc.add(ClearHomeEvent());
            },
          ),
        ],
      ),
      body: HomeScreen(bloc: widget.bloc),
    );
  }
}
