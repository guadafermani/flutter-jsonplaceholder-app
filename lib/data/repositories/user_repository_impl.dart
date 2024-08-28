import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_placeholder_app/domain/models/user.dart';
import 'package:flutter_placeholder_app/data/cache/cache_helper.dart';
import '../../domain/repositories/user_repositoy.dart';

class UserRepositoryImpl implements UserRepository {
  final String _baseUrl = 'https://jsonplaceholder.typicode.com';
  final String _cacheKey = 'cachedUsers';

  @override
  Future<List<User>> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/users'));

      if (response.statusCode == 200) {
        CacheHelper.saveData(_cacheKey, response.body);
        return parseUsers(response.body);
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      final cachedData = await CacheHelper.getData(_cacheKey);
      if (cachedData != null) {
        return parseUsers(cachedData);
      } else {
        throw Exception('No cached data available');
      }
    }
  }

  List<User> parseUsers(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<User>((json) => User.fromJson(json)).toList();
  }
}
