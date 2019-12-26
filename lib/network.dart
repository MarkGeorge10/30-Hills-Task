import 'dart:convert';

import 'package:flutter/services.dart';

import 'Model/User.dart';

class Network {
  Future<List<UserSingleton>> parseJosn() async {
    String response = await _loadAStudentAsset();
    if (response == null) {
      return null;
    }
    final parsed =
        json.decode(response.toString()).cast<Map<String, dynamic>>();

    return parsed
        .map<UserSingleton>((json) => new UserSingleton.fromJson(json))
        .toList();
  }

  Future<String> _loadAStudentAsset() async {
    return await rootBundle.loadString('assest/data.json');
  }
}
