import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:l2t_alpha/authentication/authentication.dart';
import 'package:l2t_alpha/login/login.dart';
import 'package:l2t_alpha/login_flow/login_flow.dart';
import './hoverLogo.dart';

import '../cubit/navigation_cubit.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    final stateNav = context.watch<NavigationCubit>().state;
    final stateAuth = context.watch<AuthenticationBloc>().state.status;
    return NavBarView(stateNav: stateNav, statusAuth: stateAuth);
  }
}

class NavBarView extends StatefulWidget {
  NavBarView({
    required this.stateNav,
    required this.statusAuth,
  });

  final NavigationState stateNav;
  final AuthenticationStatus statusAuth;

  @override
  _NavBarViewState createState() => _NavBarViewState();
}

void onPressed() {
  print('pressed');
}

class _NavBarViewState extends State<NavBarView> {
  bool isHovering = false;
  int position = 0;
  @override
  Widget build(BuildContext context) {
    return widget.statusAuth == AuthenticationStatus.authenticated
        ? AppBar(
            title: const Text('Auth'),
            actions: <Widget>[
              IconButton(
                color: widget.stateNav == NavigationState.home
                    ? Colors.red
                    : Colors.black,
                icon: const Icon(Icons.home_outlined),
                onPressed: () => {
                  context.read<NavigationCubit>().home(),
                },
              ),
              IconButton(
                color: widget.stateNav == NavigationState.learn
                    ? Colors.red
                    : Colors.black,
                icon: const Icon(Icons.access_alarm_outlined),
                onPressed: () => {
                  context.read<NavigationCubit>().page1(),
                },
              ),
              IconButton(
                color: widget.stateNav == NavigationState.page2
                    ? Colors.red
                    : Colors.black,
                icon: const Icon(Icons.ac_unit_outlined),
                onPressed: () => {
                  context.read<NavigationCubit>().page2(),
                },
              ),
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
            title: Row(
              children: [
                HoverLogo(
                  onTap: () => context.read<NavigationCubit>().home(),
                  visible:
                      widget.stateNav == NavigationState.home ? false : true,
                  position: position,
                ),
                IconButton(
                  color: widget.stateNav == NavigationState.learn
                      ? Colors.red
                      : Colors.black,
                  icon: const Icon(Icons.school),
                  onPressed: () => {
                    context.read<NavigationCubit>().page1(),
                  },
                ),
                IconButton(
                  color: widget.stateNav == NavigationState.page2
                      ? Colors.red
                      : Colors.black,
                  icon: const Icon(Icons.ac_unit_outlined),
                  onPressed: () => {
                    context.read<NavigationCubit>().page2(),
                  },
                ),
              ],
            ),
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
          );

    // AppBar(
    //   actions: [
    // IconButton(
    //   color: widget.stateNav == NavigationState.home
    //       ? Colors.red
    //       : Colors.black,
    //   icon: const Icon(Icons.home_outlined),
    //   onPressed: () => {
    //     context.read<NavigationCubit>().home(),
    //   },
    // ),
    // IconButton(
    //   color: widget.stateNav == NavigationState.page1
    //       ? Colors.red
    //       : Colors.black,
    //   icon: const Icon(Icons.access_alarm_outlined),
    //   onPressed: () => {
    //     context.read<NavigationCubit>().page1(),
    //   },
    // ),
    // IconButton(
    //   color: widget.stateNav == NavigationState.page2
    //       ? Colors.red
    //       : Colors.black,
    //   icon: const Icon(Icons.ac_unit_outlined),
    //   onPressed: () => {
    //     context.read<NavigationCubit>().page2(),
    //   },
    // ),
    //     widget.statusAuth == AuthenticationStatus.unauthenticated
    //         ? Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: OutlinedButton(
    //                 child: const Text('Sign-up',
    //                     style: (TextStyle(color: Colors.white))),
    //                 onPressed: () {}),
    //           )
    //         : Container(),
    //     widget.statusAuth == AuthenticationStatus.unauthenticated
    //         ? Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: OutlinedButton(
    //                 child: const Text('login',
    //                     style: (TextStyle(color: Colors.white))),
    //                 onPressed: () {}),
    //           )
    //         : Container()
    //   ],
    // );
  }
}
