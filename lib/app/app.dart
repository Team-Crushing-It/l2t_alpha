// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:l2t_alpha/l10n/l10n.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:l2t_alpha/authentication/authentication.dart';

import 'package:authentication_repository/authentication_repository.dart';

import 'package:l2t_alpha/homepage_auth/homepage_auth.dart';
import 'package:l2t_alpha/homepage_unauth/homepage_unauth.dart';
import 'package:l2t_alpha/counter/counter.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.authenticationRepository,
  }) : super(key: key);

  final AuthenticationRepository authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
          authenticationRepository: authenticationRepository,
        ),
        child: AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: const Color(0xFF13B9FF),
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
      ),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      builder: (context, child) {
        return FlowBuilder<AuthenticationState>(
          state: context.select((AuthenticationBloc bloc) => bloc.state),
          onGeneratePages: (AuthenticationState state, List<Page> pages) {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                return [CounterPage.page()];
              case AuthenticationStatus.unauthenticated:
              default:
                return [HomePageUnAuth.page()];
            }
          },
        );
      },
    );
  }
}
