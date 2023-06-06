import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_flutter/home/index.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({
    required this.bloc,
    super.key,
  }) ;

  @protected
  final HomeBloc bloc;

  @override
  State<HomeScreen> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    if (!widget.bloc.state.hasData) {
      _load();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: widget.bloc,
      builder: (
        BuildContext context,
        HomeState currentState,
      ) {
        return currentState.when(
          onLoading: ()=>const CircularProgressIndicator(),
          onEmpty: (data) =>  _Empty(),
          onData: (data) =>  _BodyList(data: data),
          onError: (e) =>  Center(
            child: Column(
              children: [
                Text(e.toString()),
                TextButton(
                  onPressed: _load,
                  child: const Text('ReLoad'),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void _load() {
    widget.bloc.add(LoadHomeEvent(id:'1'));
  }

}


class _BodyList extends StatefulWidget {
  const _BodyList({required this.data});

  final HomeViewModel data;

  @override
  State<_BodyList> createState() => _BodyListState();
}

class _BodyListState extends State<_BodyList> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return CustomScrollView(
        // primary: true,
        slivers: [
          const SliverToBoxAdapter(child: Divider()),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
          final item = widget.data.items![index];
          if (index == 0) {
            return Text('Header $index, id = ${item.name}');
          }
          return Text('Index $index, id = ${item.name}');
        },
        childCount: widget.data.items!.length,
    ))]);
  }
}


class _Empty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        Text('Empty'),
      ],
    );
  }
}