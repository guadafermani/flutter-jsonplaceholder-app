import '../models/user.dart';
import '../repositories/user_repositoy.dart';

class FetchUsersUseCase {
  final UserRepository _userRepository;

  FetchUsersUseCase(this._userRepository);

  Future<List<User>> execute() async {
    return await _userRepository.fetchUsers();
  }
}
