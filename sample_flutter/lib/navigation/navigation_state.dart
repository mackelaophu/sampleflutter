import 'package:equatable/equatable.dart';

sealed class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];
}

final class NavigationInitial extends NavigationState {}
final class NavigationLoading extends NavigationState {
  const NavigationLoading();
}


final class NavigationLoaded extends NavigationState {
  const NavigationLoaded();
}