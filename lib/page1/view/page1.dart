import 'package:flutter/material.dart';
import 'package:l2t_alpha/navigation/navbar/navbar.dart';

class Page1 extends StatelessWidget {
  static Page page() => MaterialPage<void>(child: Page1());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      body: const Center(
          child:
              Text('Page1', style: TextStyle(fontSize: 40, color: Colors.red))),
    );
  }
}
