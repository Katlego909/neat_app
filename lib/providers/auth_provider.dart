import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  bool _isChecking = true;
  bool _hasCompletedOnboarding = false;
  String _username = '';
  String _email = ''; // New field to store email

  bool get isLoggedIn => _isLoggedIn;
  bool get isChecking => _isChecking;
  bool get hasCompletedOnboarding => _hasCompletedOnboarding;
  String get username => _username;
  String get email => _email; // New getter for email

  Future<void> completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasCompletedOnboarding', true);
    _hasCompletedOnboarding = true;
    notifyListeners();
  }

  Future<void> signUp(String username, String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('email', email); // Save email
    await prefs.setString('password', password);
    await prefs.setBool('isLoggedIn', true);
    await prefs.setBool('hasCompletedOnboarding', true);
    _isLoggedIn = true;
    _hasCompletedOnboarding = true;
    _username = username;
    _email = email; // Set email
    _isChecking = false;
    notifyListeners();
  }

  Future<void> signIn(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final storedEmail = prefs.getString('email');
    final storedPassword = prefs.getString('password');

    if (email == storedEmail && password == storedPassword) {
      await prefs.setBool('isLoggedIn', true);
      _isLoggedIn = true;
      _username = prefs.getString('username') ?? '';
      _email = storedEmail ?? ''; // Retrieve email
      _isChecking = false;
      notifyListeners();
    } else {
      throw ('Invalid credentials');
    }
  }

  Future<void> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    _username = prefs.getString('username') ?? '';
    _email = prefs.getString('email') ?? ''; // Retrieve email
    _hasCompletedOnboarding = prefs.getBool('hasCompletedOnboarding') ?? false;
    _isChecking = false;
    notifyListeners();
  }

  Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
    await prefs.remove('username');
    await prefs.remove('email'); // Remove email
    _isLoggedIn = false;
    _username = '';
    _email = ''; // Clear email
    _isChecking = false;
    notifyListeners();
  }
}
