
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_flutter/navigation/navigation_event.dart';
import 'package:sample_flutter/navigation/navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent,NavigationState> {

  NavigationBloc():super(NavigationInitial()){
    on<NavigationAddScreen>((event, emit) {
      emit(const NavigationLoading());
      _addPage();
      emit(const NavigationLoaded());
    });
    on<NavigationPopScreen>((event, emit) {
      emit(const NavigationLoading());
      _popPage();
      emit(const NavigationLoaded());
    });
  }

  void _addPage() {
  
  }

  void _popPage(){

  }

}