import 'package:ff_bloc/ff_bloc.dart';

import 'package:sample_flutter/home/index.dart';

class HomeState extends FFState<HomeState, HomeViewModel> {
  const HomeState({
    super.version = 0,
    super.isLoading = false,
    super.data,
    super.error,
  });

  @override
  StateCopyFactory<HomeState, HomeViewModel> getCopyFactory() => HomeState.new;
}
