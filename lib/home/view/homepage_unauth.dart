import 'dart:math';
import 'package:flutter/material.dart';
import 'package:l2t_alpha/navigation/navbar/navbar.dart';

class HomePageUnAuth extends StatefulWidget {
  static Page page() => MaterialPage<void>(child: HomePageUnAuth());

  @override
  _HomePageUnAuthState createState() => _HomePageUnAuthState();
}

class _HomePageUnAuthState extends State<HomePageUnAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      body: Column(
        children: [
          const FirstSection(),
          // const SecondSection(),
        ],
      ),
      extendBodyBehindAppBar: true,
    );
  }
}

class FirstSection extends StatefulWidget {
  const FirstSection({Key? key}) : super(key: key);

  @override
  _FirstSectionState createState() => _FirstSectionState();
}

class _FirstSectionState extends State<FirstSection> {
  int rand = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          height: 1000,
          color: const Color(0xffF7F9FF),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: 300,
                    width: 500,
                    child: InkWell(
                        onTap: () {},
                        onHover: (v) {
                          setState(() {
                            rand = Random().nextInt(6);
                          });
                        },
                        child: Image.asset('assets/logo/$rand.png'))),
                Text('Learn how to build your vision',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headline1!
                        .copyWith(fontSize: 50))
              ],
            ),
          )),
    );
  }
}

class SecondSection extends StatelessWidget {
  const SecondSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          height: 1000,
          // color: const Color(0xffF7F9FF),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(child: Image.asset('assets/hero.png')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: Text('Learn how to build your vision',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headline1!
                          .copyWith(fontSize: 50)),
                )
              ],
            ),
          )),
    );
  }
}
