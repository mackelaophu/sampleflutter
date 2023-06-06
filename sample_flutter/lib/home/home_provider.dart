
import 'dart:async';
import 'package:sample_flutter/home/index.dart';

class HomeProvider {

  Future<List<HomeModel>?> fetchAsync(String? id) async {
    if (id == null) {
      return null;
    }
    return [HomeModel(name: id)];
  }


  Future<List<HomeModel>?> addMore(List<HomeModel>? now) async {
    final result = [
      ...(now ?? <HomeModel>[]),
      HomeModel(name: now?.length.toString() ?? '0')
    ];
    return result;
  }

}

