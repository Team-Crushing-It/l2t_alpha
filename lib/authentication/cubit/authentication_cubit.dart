import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

enum AuthenticationState { authenticated, unauthenticated }

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationState.unauthenticated);

  void login() {
    emit(AuthenticationState.authenticated);
  }

  void logout() {
    emit(AuthenticationState.unauthenticated);
  }
}
