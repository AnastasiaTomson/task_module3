import 'package:task1/src/interfaces/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<bool> authenticate(String email, String password) async {
    Future.delayed(Duration(seconds: 1));
    if(email == 'example@sample.com' && password == '5') {
      return true;
    }else{
      return false;
    }
  }

  @override
  Future<bool> socialAuthenticate() async {
    Future.delayed(Duration(seconds: 2));
    return true;
  }
}
