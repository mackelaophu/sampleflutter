// ignore: depend_on_referenced_packages
import 'package:equatable/equatable.dart';

class HomeModel extends Equatable {
  const HomeModel({
    required this.name,
  });
  final String name;

  @override
  List<Object> get props => [ name];

  Map<dynamic, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  static HomeModel? fromMap(Map<dynamic, dynamic>? map) {
    if (map == null) {
      return null;
    }

    return HomeModel(
      name: map['name']!.toString(),
    );
  }

}

class HomeViewModel extends Equatable {
  const HomeViewModel({
    required this.items,
  });

  final List<HomeModel>? items;

  @override
  List<Object?> get props => [items];

  HomeViewModel copyWith({
    List<HomeModel>? items,
  }) {
    return  HomeViewModel(
        items: items ?? this.items,
      );
  }
}
