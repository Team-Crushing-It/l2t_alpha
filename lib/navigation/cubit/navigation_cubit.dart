import 'package:bloc/bloc.dart';

enum NavigationState { home, page1, page2, page3 }

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState.home);

  void home() {
    emit(NavigationState.home);
  }

  void page1() {
    emit(NavigationState.page1);
  }

  void page2() {
    emit(NavigationState.page2);
  }
}
