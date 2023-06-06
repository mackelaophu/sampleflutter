import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:ff_bloc/ff_bloc.dart';

import 'package:sample_flutter/home/index.dart';

@immutable
abstract class HomeEvent implements FFBlocEvent<HomeState, HomeBloc> {}

class LoadHomeEvent extends HomeEvent {
  LoadHomeEvent({required this.id});
  final String? id;
  
  static const String _name = 'LoadHomeEvent';

  @override
  String toString() => _name;

  @override
  Stream<HomeState> applyAsync({required HomeBloc bloc}) async* {
    yield bloc.state.copyWithoutError(isLoading: true);
    final result = await bloc.provider.fetchAsync(id);
    yield bloc.state.copyWithoutError(
      isLoading: false,
      data: HomeViewModel(items: result),
    );
  }
}


class AddHomeEvent extends HomeEvent {
  static const String _name = 'AddHomeEvent';

  @override
  String toString() => _name;

  @override
  Stream<HomeState> applyAsync({required HomeBloc bloc}) async* {
    yield bloc.state.copyWithoutError(isLoading: true);
    final result = await bloc.provider.addMore(bloc.state.data?.items);
    yield bloc.state.copyWithoutError(
      isLoading: false,
      data: HomeViewModel(items: result),
    );
  }
}

class ErrorYouAwesomeEvent extends HomeEvent {
  static const String _name = 'ErrorYouAwesomeEvent';

  @override
  String toString() => _name;

  @override
  Stream<HomeState> applyAsync({required HomeBloc bloc}) async* {
    throw Exception('Test error');
  }
}

class ClearHomeEvent extends HomeEvent {
  static const String _name = 'ClearHomeEvent';

  @override
  String toString() => _name;

  @override
  Stream<HomeState> applyAsync({required HomeBloc bloc}) async* {
    yield bloc.state.copyWithoutError(isLoading: true);
    yield bloc.state.copyWithoutData(
      isLoading: false,
    );
  }
}
