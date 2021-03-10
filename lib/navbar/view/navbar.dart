import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:l2t_alpha/authentication/authentication.dart';
import 'package:l2t_alpha/login/login.dart';
import 'package:l2t_alpha/login_flow/login_flow.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) =>
          // Authenticated Navbar ==============================
          state.status == AuthenticationStatus.authenticated
              ? AppBar(
                  title: const Text('Auth'),
                  actions: <Widget>[
                    IconButton(
                      key: const Key('homePage_logout_iconButton'),
                      icon: const Icon(Icons.exit_to_app),
                      onPressed: () => context
                          .read<AuthenticationBloc>()
                          .add(AuthenticationLogoutRequested()),
                    )
                  ],
                )
              // UnAuthenticaed NavBar ====================================
              : AppBar(
                  title: const Text('UnAuth'),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                        child: const Text('Sign-up',
                            style: (TextStyle(color: Colors.white))),
                        onPressed: () async {
                          await Navigator.of(context).push<LoginState>(
                            LoginFlow.route(),
                          );
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              const SnackBar(
                                content: Text('Login Flow Complete!'),
                              ),
                            );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                        child: const Text('Login',
                            style: (TextStyle(color: Colors.white))),
                        onPressed: () async {
                          await Navigator.of(context).push<LoginState>(
                            LoginFlow.route(),
                          );
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              const SnackBar(
                                content: Text('Login Flow Complete!'),
                              ),
                            );
                        },
                      ),
                    ),
                  ],
                ),
    );
  }
}
