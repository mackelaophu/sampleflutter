import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_flutter/home/index.dart';
import 'package:sample_flutter/navigation/navigation_bloc.dart';
import 'package:sample_flutter/navigation/navigation_event.dart';
import 'package:sample_flutter/navigation/navigation_state.dart';


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
      body: BlocBuilder<NavigationBloc, NavigationState>(builder: (context,state) {
        return switch (state) {
          NavigationInitial() => const Text("loading"),
          NavigationLoading() => const Center(child: CircularProgressIndicator(),),
          NavigationLoaded() => HomeScreen(bloc: widget.bloc)
        };
      }
      ),floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<NavigationBloc>().add(NavigationAddScreen()),
        tooltip: 'Start',
        child: const Icon(Icons.timer),
      ),
    );
  }
}
