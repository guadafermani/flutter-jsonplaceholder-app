class LoginAuthUseCase {
  final String _validEmail = 'challenge@fudo';
  final String _validPassword = 'password';

  bool authenticate(String email, String password) {
    return email == _validEmail && password == _validPassword;
  }
}
