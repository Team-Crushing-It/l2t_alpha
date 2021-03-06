import 'package:flutter/material.dart';
import 'package:l2t_alpha/login/login.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:l2t_alpha/authentication/authentication.dart';

class LoginPage extends StatelessWidget {
  static Page page() => MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        leading: BackButton(
          onPressed: () {
            context.flow<AuthenticationState>().complete();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LoginForm(),
      ),
    );
  }
}
