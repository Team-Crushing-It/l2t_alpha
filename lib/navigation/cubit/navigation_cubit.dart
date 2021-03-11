import 'package:bloc/bloc.dart';

enum NavigationState { home, learn, page2, page3 }

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState.home);

  void home() {
    emit(NavigationState.home);
  }

  void page1() {
    emit(NavigationState.learn);
  }

  void page2() {
    emit(NavigationState.page2);
  }
}
