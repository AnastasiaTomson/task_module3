import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task1/src/interfaces/auth_repository.dart';
import 'package:task1/src/models/user.dart';
import 'package:task1/src/repositories/auth_repository_impl.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthRepository authRepository = AuthRepositoryImpl();

  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<Authenticate>((event, emit) async {
      User? user = await authRepository.authenticate(event.email, event.password);
      user != null ? emit(Authenticated(user)) : emit(ErrorAuthenticated());
    });

    on<SocialAuthenticate>((event, emit) async {
      User? user = await authRepository.socialAuthenticate();
      user != null ? emit(Authenticated(user)) : emit(ErrorAuthenticated());
    });

    on<Logout>((event, emit) async {
      emit(UnAuthenticated());
    });
  }
}
