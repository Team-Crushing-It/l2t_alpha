import 'package:flutter/material.dart';
import 'package:l2t_alpha/navigation/navbar/navbar.dart';
import 'package:l2t_alpha/counter/view/counter_page.dart';

class HomePageUnAuth extends StatelessWidget {
  static Page page() => MaterialPage<void>(child: HomePageUnAuth());

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

class FirstSection extends StatelessWidget {
  const FirstSection({Key? key}) : super(key: key);

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
                Container(height: 500, child: Image.asset('assets/hero.png')),
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
                Container(height: 500, child: Image.asset('assets/hero.png')),
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
