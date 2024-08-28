import 'package:flutter/material.dart';
import 'package:flutter_placeholder_app/domain/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService;
  bool _isAuthenticated = false;

  AuthProvider(this._authService);

  bool get isAuthenticated => _isAuthenticated;

  void login(String email, String password) {
    _isAuthenticated = _authService.authenticate(email, password);
    notifyListeners();
  }

  // In case we implement logout in the future
  void logout() {
    _isAuthenticated = false;
    notifyListeners();
  }
}
