import 'package:task1/src/models/user.dart';

abstract class AuthRepository {
  Future<User?> authenticate(String email, String password);

  Future<User?> socialAuthenticate();
}
