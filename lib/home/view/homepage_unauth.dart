import 'package:flutter/material.dart';
import 'package:l2t_alpha/navigation/navbar/navbar.dart';

class HomePageUnAuth extends StatelessWidget {
  static Page page() => MaterialPage<void>(child: HomePageUnAuth());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      body: const Center(child: Text('Home UnAuthenticated')),
    );
  }
}
