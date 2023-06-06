import 'package:ff_bloc/ff_bloc.dart';

import 'package:sample_flutter/home/index.dart';

class HomeBloc extends FFBloc<HomeEvent, HomeState> {
  HomeBloc({    
    required this.provider,
    super.initialState = const HomeState(),
  });

  final HomeProvider provider;

  @override
  HomeState onErrorState(Object error) => state.copy(error: error, isLoading: false);

}
