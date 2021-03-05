import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:authentication_repository/authentication_repository.dart';

import 'package:l2t_alpha/login/view/login_page.dart';
import 'package:l2t_alpha/login/login.dart';

class LoginFlow extends StatelessWidget {
  static Route<LoginState> route() {
    return MaterialPageRoute(
      builder: (_) => BlocProvider(
          create: (_) => LoginCubit(AuthenticationRepository()),
          child: LoginFlow()),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Felix, whether I put an Authentication or a Login listener here,
    // Neither of them kick me out of this flow.
    // You can tell by HomePageAuth
    // Toplevel flow when auth is CounterPage
    return FlowBuilder<LoginState>(
      state: context.select((LoginCubit cubit) => cubit.state),
      onGeneratePages: (LoginState state, List<Page> pages) {
        switch (state.status) {
          // case FormzStatus.submissionFailure
          //   return [LoginFailure.page()];
          case FormzStatus.pure:
          default:
            return [LoginPage.page()];
        }
      },
    );
  }
}
