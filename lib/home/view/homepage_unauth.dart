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
  Image? image0;
  Image? image1;
  Image? image2;
  Image? image3;
  Image? image4;
  Image? image5;
  Image? image6;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    image0 = Image.asset("assets/logo/0.png");
    image1 = Image.asset("assets/logo/1.png");
    image2 = Image.asset("assets/logo/2.png");
    image3 = Image.asset("assets/logo/3.png");
    image4 = Image.asset("assets/logo/4.png");
    image5 = Image.asset("assets/logo/5.png");
    image6 = Image.asset("assets/logo/6.png");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    precacheImage(image0!.image, context);
    precacheImage(image1!.image, context);
    precacheImage(image2!.image, context);
    precacheImage(image3!.image, context);
    precacheImage(image4!.image, context);
    precacheImage(image5!.image, context);
    precacheImage(image6!.image, context);
    print("prechade went very well");
  }

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
