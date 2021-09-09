import 'dart:html';
import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:l2t_alpha/home/view/screens/mobile_view.dart';
import 'package:l2t_alpha/home/view/screens/desktop_view.dart';
import 'package:responsive_builder/responsive_builder.dart';
// ignore: use_key_in_widget_constructors
class HomePageUnAuth extends StatefulWidget {
  static Page page() => MaterialPage<void>(child: HomePageUnAuth());

  @override
  _HomePageUnAuthState createState() => _HomePageUnAuthState();
}

class _HomePageUnAuthState extends State<HomePageUnAuth> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop:DesktopView(),
      mobile:MobileView()  ,);
  }
}
