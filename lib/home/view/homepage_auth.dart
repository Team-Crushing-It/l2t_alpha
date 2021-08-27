import 'package:flutter/material.dart';
import 'package:l2t_alpha/navigation/navbar/navbar.dart';
import 'package:l2t_alpha/authentication/authentication.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../home/home.dart';

class HomePageAuth extends StatelessWidget {
  static Page page() => MaterialPage<void>(child: HomePageAuth());

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthenticationBloc>().state.user;

    return Scaffold(
      appBar: NavBar(),
      body: Center(
        child: Column(
          children: [
            Avatar(photo: user.photo),
            Text(user.email),
          ],
        ),
      ),
    );
  }
}
