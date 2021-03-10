import 'package:flutter/material.dart';
import '../cubit/navigation_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:l2t_alpha/authentication/authentication.dart';

import 'package:l2t_alpha/login/login.dart';

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

class _NavBarViewState extends State<NavBarView> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
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
          color: widget.stateNav == NavigationState.page1
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
        widget.statusAuth == AuthenticationStatus.unauthenticated
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                    child: const Text('Sign-up',
                        style: (TextStyle(color: Colors.white))),
                    onPressed: () {}),
              )
            : Container(),
        widget.statusAuth == AuthenticationStatus.unauthenticated
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                    child: const Text('login',
                        style: (TextStyle(color: Colors.white))),
                    onPressed: () {}),
              )
            : Container()
      ],
    );
  }
}
