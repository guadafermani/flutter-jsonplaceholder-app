import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_placeholder_app/domain/models/user.dart';

import '../domain/repositories/user_repositoy.dart';

class UserRepositoryImpl implements UserRepository {
  final String _baseUrl = 'https://jsonplaceholder.typicode.com';

  @override
  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse('$_baseUrl/users'));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
