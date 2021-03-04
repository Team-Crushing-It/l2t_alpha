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

import 'package:l2t_alpha/authentication/cubit/authentication_cubit.dart';
import 'package:l2t_alpha/homepage_auth/homepage_auth.dart';
import 'package:l2t_alpha/homepage_unauth/homepage_unauth.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: const Color(0xFF13B9FF),
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
      ),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: BlocProvider(
        create: (context) => AuthenticationCubit(),
        child: AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlowBuilder<AuthenticationState>(
      state: context.select((AuthenticationCubit cubit) => cubit.state),
      onGeneratePages: (AuthenticationState state, List<Page> pages) {
        switch (state) {
          case AuthenticationState.authenticated:
            return [HomePageAuth.page()];
          case AuthenticationState.unauthenticated:
          default:
            return [HomePageUnAuth.page()];
        }
      },
    );
  }
}
