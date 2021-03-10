import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:l2t_alpha/authentication/authentication.dart';
import 'package:l2t_alpha/home/home.dart';

class Home extends StatelessWidget {
  static Page page() => MaterialPage<void>(child: Home());

  @override
  Widget build(BuildContext context) {
    final status = context.select<AuthenticationBloc, AuthenticationStatus>(
        (bloc) => bloc.state.status);
    return status == AuthenticationStatus.authenticated
        ? HomePageAuth()
        : HomePageUnAuth();
  }
}
