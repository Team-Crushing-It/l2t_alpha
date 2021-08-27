import 'package:bloc/bloc.dart';
import 'package:authentication_repository/authentication_repository.dart';

enum NavigationState { home, learn, page2, page3 }

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit(this._authenticationRepository) : super(NavigationState.home);

  final AuthenticationRepository _authenticationRepository;

  void home() {
    emit(NavigationState.home);
  }

  void page1() {
    emit(NavigationState.learn);
  }

  void page2() {
    emit(NavigationState.page2);
  }

  Future<void> logInWithGitHub() async {
    try {
      await _authenticationRepository.logInWithGitHub();
    } on Exception {
      print('failed');
    } on NoSuchMethodError {
      print('nosuchmethoderror');
    }
  }
}
