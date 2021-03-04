import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:l2t_alpha/authentication/authentication.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => const Size.fromHeight(50);

  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) => state.status ==
              AuthenticationStatus.authenticated
          ? AppBar(
              title: const Text('Auth'),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    child: const Text('Logout',
                        style: (TextStyle(color: Colors.white))),
                    onPressed: () {
                      // context.read<AuthenticationCubit>().logout();
                    },
                  ),
                ),
              ],
            )
          : AppBar(
              title: const Text('UnAuth'),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    child: const Text('Sign-up',
                        style: (TextStyle(color: Colors.white))),
                    onPressed: () async {
                      // await Navigator.of(context).push<AuthenticationState>(
                      //   AuthenticationFlow.route(),
                      // );
                      // ScaffoldMessenger.of(context)
                      //   ..hideCurrentSnackBar()
                      //   ..showSnackBar(
                      //     const SnackBar(
                      //       content: Text('Authentication Flow Complete!'),
                      //     ),
                      //   );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    child:
                        Text('Login', style: (TextStyle(color: Colors.white))),
                    onPressed: () async {
                      // await Navigator.of(context).push<AuthenticationState>(
                      //   AuthenticationFlow.route(),
                      // );
                      // ScaffoldMessenger.of(context)
                      //   ..hideCurrentSnackBar()
                      //   ..showSnackBar(
                      //     const SnackBar(
                      //       content: Text('Welcome to Authenticated Life!'),
                      //     ),
                      //   );
                    },
                  ),
                ),
              ],
            ),
    );

    // AppBar(
    //   title: BlocBuilder<AuthenticationCubit, AuthenticationState>(
    //     builder: (context, state) => state == AuthenticationState.authenticated
    //         ? Text('Auth')
    //         : Text('Unauth'),
    //   ),
    //   actions: [
    //     Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: OutlinedButton(
    //         child: Text('Login', style: (TextStyle(color: Colors.white))),
    //         onPressed: () async {
    //           await Navigator.of(context).push<AuthenticationState>(
    //             AuthenticationFlow.route(),
    //           );
    //           ScaffoldMessenger.of(context)
    //             ..hideCurrentSnackBar()
    //             ..showSnackBar(
    //               const SnackBar(
    //                 content: Text('Authentication Flow Complete!'),
    //               ),
    //             );
    //         },
    //       ),
    //     ),
    //   ],
    // );
  }
}
