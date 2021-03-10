import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:l2t_alpha/l10n/l10n.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:l2t_alpha/authentication/authentication.dart';
import 'package:l2t_alpha/navigation/cubit/navigation_cubit.dart';

import 'package:l2t_alpha/home/home.dart';
import 'package:l2t_alpha/page1/page1.dart';
import 'package:l2t_alpha/page2/page2.dart';

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
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthenticationBloc(
              authenticationRepository: authenticationRepository,
            ),
          ),
          BlocProvider(
            create: (_) => NavigationCubit(),
          )
        ],
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
        return FlowBuilder<NavigationState>(
          state: context.select((NavigationCubit cubit) => cubit.state),
          onGeneratePages: (NavigationState state, List<Page> pages) {
            switch (state) {
              case NavigationState.home:
                return [Home.page()];
              case NavigationState.page1:
                return [Page1.page()];
              case NavigationState.page2:
                return [Page2.page()];
              default:
                return [Home.page()];
            }
          },
        );
      },
    );
  }
}
