
import 'package:equatable/equatable.dart';

sealed class NavigationEvent extends Equatable {
  const NavigationEvent();
  
  @override
  List<Object> get props => [];
}

final class NavigationAddScreen extends NavigationEvent {}
final class NavigationPopScreen extends NavigationEvent {}