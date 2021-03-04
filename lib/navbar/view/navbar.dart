import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:l2t_alpha/authentication/cubit/authentication_cubit.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => const Size.fromHeight(50);

  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) => state == AuthenticationState.authenticated
          ? AppBar(
              title: Text('Auth'),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    child:
                        Text('Logout', style: (TextStyle(color: Colors.white))),
                    onPressed: () {
                      context.read<AuthenticationCubit>().logout();
                    },
                  ),
                ),
              ],
            )
          : AppBar(
              title: Text('UnAuth'),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    child: Text('Sign-up',
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
