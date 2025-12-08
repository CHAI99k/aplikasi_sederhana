class AuthService {
  // dummy in-memory store (email -> password)
  static final Map<String, String> _users = {};

  static Future<bool> register(String email, String password) async {
    await Future.delayed(Duration(milliseconds: 300)); // simulate delay
    if (_users.containsKey(email)) return false;
    _users[email] = password;
    return true;
  }

  static Future<bool> login(String email, String password) async {
    await Future.delayed(Duration(milliseconds: 300));
    final pass = _users[email];
    return pass != null && pass == password;
  }
}
