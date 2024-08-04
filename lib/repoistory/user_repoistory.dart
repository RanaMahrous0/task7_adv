import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:task7_adv/models/users.dart';

class UserRepoistory {
  Future<List<Users>> getUsers() async {
    try {
      var result = await rootBundle.loadString('assets/data.json');
      final List<dynamic> users = json.decode(result);
      return List<Users>.from(users.map((e) => Users.fromJson(e)).toList());
    } catch (e) {
      rethrow;
    }
  }
}
