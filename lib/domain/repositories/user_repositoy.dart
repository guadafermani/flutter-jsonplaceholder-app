import 'package:flutter_placeholder_app/domain/models/user.dart';

abstract class UserRepository {
  Future<List<User>> fetchUsers();
}
