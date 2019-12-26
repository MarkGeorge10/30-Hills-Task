import 'dart:convert';

import 'package:flutter/services.dart';

import 'Model/User.dart';

class Network {
  Future<List<User>> parseJosn() async {
    String response = await _loadAStudentAsset();
    if (response == null) {
      return null;
    }
    final parsed =
        json.decode(response.toString()).cast<Map<String, dynamic>>();

    return parsed.map<User>((json) => new User.fromJson(json)).toList();
  }

  Future<String> _loadAStudentAsset() async {
    return await rootBundle.loadString('assest/data.json');
  }
}
