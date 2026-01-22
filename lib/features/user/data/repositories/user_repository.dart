import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import '../../domain/entities/user.dart';
import '../models/user_model.dart';

class UserRepository {
  Future<List<User>> getNearbyUsers() async {
    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Return mock data
    // Later, this will fetch from Firebase
    if (kDebugMode) {
      final String jsonString =
          await rootBundle.loadString('assets/json/mock_users.json');
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((e) => UserModel.fromJson(e)).toList();
    }

    return [
      User(
        id: '1',
        name: 'Alice Johnson',
        phone: '+62 812 1111 1111',
        distance: 50.0,
        status: 'Available',
      ),
      User(
        id: '2',
        name: 'Bob Wilson',
        phone: '+62 812 2222 2222',
        distance: 120.0,
        status: 'At work',
      ),
      User(
        id: '3',
        name: 'Charlie Brown',
        phone: '+62 812 3333 3333',
        distance: 200.0,
        status: 'Busy',
      ),
    ];
  }

  Future<User?> getUserById(String id) async {
    // Simulate API delay
    final users = await getNearbyUsers();

    try {
      return users.firstWhere((user) => user.id == id);
    } catch (e) {
      return null;
    }
  }
}
