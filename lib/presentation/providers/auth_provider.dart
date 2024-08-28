import 'package:flutter/material.dart';
import 'package:flutter_placeholder_app/domain/usecases/login_auth_usecase.dart';

class AuthProvider with ChangeNotifier {
  final LoginAuthUseCase _loginAuthUseCase;
  bool _isAuthenticated = false;

  AuthProvider(this._loginAuthUseCase);

  bool get isAuthenticated => _isAuthenticated;

  void login(String email, String password) {
    _isAuthenticated = _loginAuthUseCase.authenticate(email, password);
    notifyListeners();
  }

  // In case we implement logout in the future
  void logout() {
    _isAuthenticated = false;
    notifyListeners();
  }
}
