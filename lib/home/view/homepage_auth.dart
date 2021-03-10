import 'package:flutter/material.dart';
import 'package:l2t_alpha/navigation/navbar/navbar.dart';

class HomePageAuth extends StatelessWidget {
  static Page page() => MaterialPage<void>(child: HomePageAuth());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      body: const Center(child: Text('Home Authenticated')),
    );
  }
}
