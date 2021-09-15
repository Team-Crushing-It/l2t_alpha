import 'dart:html';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:coast/coast.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:l2t_alpha/navigation/navbar/navbar.dart';

import './screen_size.dart';

// ignore: use_key_in_widget_constructors
class HomePageUnAuth extends StatefulWidget {
  static Page page() => MaterialPage<void>(child: HomePageUnAuth());

  @override
  _HomePageUnAuthState createState() => _HomePageUnAuthState();
}

class _HomePageUnAuthState extends State<HomePageUnAuth> {
  final _beaches = [
    Beach(builder: (context) => const HeroSection()),
    Beach(builder: (context) => ServeSection()),
    Beach(builder: (context) => Hero2()),
    Beach(builder: (context) => Westkapelle()),
    Beach(builder: (context) => Zoutelande()),
  ];

  final _coastController = CoastController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      body: Coast(
        onPageChanged: (int) {
          print('changed to $int');
        },
        allowImplicitScrolling: true,
        scrollDirection: Axis.vertical,
        beaches: _beaches,
        controller: _coastController,
        observers: [
          CrabController(),
        ],
      ),
      extendBodyBehindAppBar: true,
    );
  }
}

///This is for transitions between crabs
Widget textFlightShuttleBuilder(
  BuildContext flightContext,
  Animation<double> animation,
  BeachTransitionDirection direction,
  BuildContext fromCrabContext,
  BuildContext? toCrabContext,
) {
  final curvedAnimation =
      CurvedAnimation(parent: animation, curve: Curves.easeInOutQuart);
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Positioned(
        top: 0,
        left: 0,
        child: FadeTransition(
          opacity: Tween<double>(begin: 1.0, end: 0.0).animate(curvedAnimation),
          child: (fromCrabContext.widget as Crab).child,
        ),
      ),
      if (toCrabContext != null)
        Positioned(
          top: 0,
          left: 0,
          child: FadeTransition(
            opacity: curvedAnimation,
            child: (toCrabContext.widget as Crab).child,
          ),
        ),
    ],
  );
}

class ServeSection extends StatelessWidget {
  const ServeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: const Color(0xffF7F9FF),
        child: Padding(
          padding: EdgeInsets.symmetric(
            //dynamic gutters
            horizontal: (MediaQuery.of(context).size.width / 12 + 48),
          ),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Crab(
                    flightShuttleBuilder: textFlightShuttleBuilder,
                    tag: 'container',
                    child: Container(
                      height: 100,
                      child: Image.asset('assets/logo/1.png'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text('Serve',
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headline1!
                            .copyWith(fontSize: 50)),
                  )
                ],
              ),
              Crab(
                  tag: 'line',
                  child: Image.asset('assets/homepage_lines/1.png')),
            ],
          ),
        ),
      );
}

class Hero2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(
            //dynamic gutters
            horizontal: (MediaQuery.of(context).size.width / 12 + 48),
          ),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Crab(
                    flightShuttleBuilder: textFlightShuttleBuilder,
                    tag: 'container',
                    child: Container(
                      height: 100,
                      child: Image.asset('assets/logo/2.png'),
                    ),
                  ),
                  Text('Test')
                ],
              ),
            ],
          ),
        ),
      );
}

class Westkapelle extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Westkapelle"),
          backgroundColor: Colors.amber,
        ),
        body: Stack(
          children: [
            Positioned(
              top: 80,
              right: 40,
              child: Crab(
                tag: "container",
                child: Container(
                  color: Colors.green,
                  width: 200,
                  height: 100,
                ),
              ),
            ),
          ],
        ),
      );
}

class Zoutelande extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Zoutelande"),
          backgroundColor: Colors.deepPurple,
        ),
        body: Stack(
          children: [
            Positioned(
              bottom: 40,
              left: 20,
              child: Crab(
                tag: "container",
                child: Container(
                  color: Colors.green,
                  width: 100,
                  height: 200,
                ),
              ),
            ),
          ],
        ),
      );
}

class HeroSection extends StatefulWidget {
  const HeroSection({Key? key}) : super(key: key);

  @override
  _HeroState createState() => _HeroState();
}

class _HeroState extends State<HeroSection> {
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
    image0 = Image.asset('assets/logo/0.png');
    image1 = Image.asset('assets/logo/1.png');
    image2 = Image.asset('assets/logo/2.png');
    image3 = Image.asset('assets/logo/3.png');
    image4 = Image.asset('assets/logo/4.png');
    image5 = Image.asset('assets/logo/5.png');
    image6 = Image.asset('assets/logo/6.png');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(image0!.image, context);
    precacheImage(image1!.image, context);
    precacheImage(image2!.image, context);
    precacheImage(image3!.image, context);
    precacheImage(image4!.image, context);
    precacheImage(image5!.image, context);
    precacheImage(image6!.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        color: const Color(0xffF7F9FF),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Crab(
                tag: 'container',
                child: Container(
                  height: 300,
                  width: 500,
                  child: InkWell(
                    onTap: () {},
                    onHover: (v) {
                      setState(() {
                        rand = Random().nextInt(6);
                      });
                    },
                    child: Image.asset('assets/logo/$rand.png'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 80.0),
                child: Text('Bring your vision to life',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headline1!
                        .copyWith(fontSize: 50)),
              )
            ],
          ),
        ));
  }
}

class IssueSection extends StatelessWidget {
  const IssueSection({Key? key}) : super(key: key);

  final String theIssueText =
      'True experts are constantly learning, and our product team found many companies overloaded with work and not enough talent to complete it. Meanwhile, there are many early-career professionals out there with great promise and not enough experience. As we iterated upon feature-based delivery, we found our experts generating more experts, and we learned how teaching-to-learn can culture innovation.';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(64),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const RotatedBox(
                quarterTurns: 3,
                child: Text('THE',
                    style: TextStyle(
                        fontFamily: 'Kreon',
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Color(0xff000000))),
              ),
              const Text('ISSUE',
                  style: TextStyle(
                      fontFamily: 'Kreon',
                      fontWeight: FontWeight.bold,
                      fontSize: 82,
                      color: Color(0xff000000)))
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.7,
            child: SelectableText(
              theIssueText,
              style: Theme.of(context)
                  .primaryTextTheme
                  .headline1!
                  .copyWith(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class SolutionSection extends StatelessWidget {
  const SolutionSection({Key? key}) : super(key: key);

  final String solutionText =
      "Empowering innovation & up-skilling through scalable feature-based delivery • Have a product you want to build? Our experts can build it for you, or they can teach you the business, design, and/or development through a real-life product so that you can teach others when building your own.";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffF7F9FF),
      padding: const EdgeInsets.all(64),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('OUR MAGIC\n SOLUTION',
                  style: TextStyle(
                      fontFamily: 'Kreon',
                      fontWeight: FontWeight.bold,
                      fontSize: 55,
                      color: Color(0xff000000))),
              Container(
                  padding: const EdgeInsets.only(left: 20),
                  width: MediaQuery.of(context).size.width / 3,
                  child: SelectableText(
                    solutionText,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headline1!
                        .copyWith(fontSize: 20),
                    textAlign: TextAlign.center,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

class WorksSection extends StatelessWidget {
  const WorksSection({Key? key}) : super(key: key);

  final String number1Text =
      // ignore: lines_longer_than_80_chars
      'Whether you want us to build your vision, or you want to learn how to build it yourself, the first step is to get matched with a team that best suits your needs';
  final String number2Text =
      // ignore: lines_longer_than_80_chars
      'As you work with our team you will be exposed to the state-of-the-art tools and approaches for building, delivering, and maintaining products.';
  final String number3Text =
      // ignore: lines_longer_than_80_chars
      "Whether you'd like to continue having your product built for you, or you'd like to start building your own, we can support your next steps";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(64),
      child: Column(
        children: [
          const Text('HOW IT WORKS',
              style: TextStyle(
                  fontFamily: 'Kreon',
                  fontWeight: FontWeight.bold,
                  fontSize: 60,
                  color: Color(0xff000000))),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(50),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(20),
                      height: 140,
                      width: 140,
                      decoration: const BoxDecoration(
                        color: const Color(0xffEF9D13),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text('1',
                            style: TextStyle(
                                fontFamily: 'Kreon',
                                fontWeight: FontWeight.bold,
                                fontSize: 115,
                                color: Color(0xffFFFFFF))),
                      ),
                    ),
                    const Text('Meet Your Team',
                        style:
                            TextStyle(fontSize: 20, color: Color(0xff000000))),
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        width: MediaQuery.of(context).size.width / 5,
                        child: SelectableText(
                          number1Text,
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headline1!
                              .copyWith(fontSize: 20),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(50),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(20),
                      height: 140,
                      width: 140,
                      decoration: const BoxDecoration(
                        color: const Color(0xffEF9D13),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text('2',
                            style: TextStyle(
                                fontFamily: 'Kreon',
                                fontWeight: FontWeight.bold,
                                fontSize: 115,
                                color: Color(0xffFFFFFF))),
                      ),
                    ),
                    const Text('Collaborate',
                        style:
                            TextStyle(fontSize: 20, color: Color(0xff000000))),
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        width: MediaQuery.of(context).size.width / 5,
                        child: SelectableText(
                          number2Text,
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headline1!
                              .copyWith(fontSize: 20),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(50),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(20),
                      height: 140,
                      width: 140,
                      decoration: const BoxDecoration(
                        color: Color(0xffEF9D13),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text('3',
                            style: TextStyle(
                                fontFamily: 'Kreon',
                                fontWeight: FontWeight.bold,
                                fontSize: 115,
                                color: Color(0xffFFFFFF))),
                      ),
                    ),
                    const Text("Grow",
                        style:
                            TextStyle(fontSize: 20, color: Color(0xff000000))),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width / 5,
                      child: SelectableText(
                        number3Text,
                        textAlign: TextAlign.start,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headline1!
                            .copyWith(fontSize: 20),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class GoogleiFrame extends StatefulWidget {
  GoogleiFrame({Key? key}) : super(key: key);

  @override
  State<GoogleiFrame> createState() => _GoogleiFrameState();
}

class _GoogleiFrameState extends State<GoogleiFrame> {
  late Widget _iframeWidget;

  final IFrameElement _iframeElement = IFrameElement();
  final _screenQueries = ScreenQueries.instance;

  @override
  void initState() {
    super.initState();

    _iframeElement.height = '500';
    _iframeElement.width = '500';

    _iframeElement.src =
        "https://www.figma.com/embed?embed_host=share&url=https%3A%2F%2Fwww.figma.com%2Fproto%2F02VhBYm6D0Kn1YT0IRouMg%2FUntitled%3Fpage-id%3D0%253A1%26node-id%3D2%253A3%26viewport%3D241%252C48%252C0.23%26scaling%3Dcontain%26starting-point-node-id%3D2%253A3";

    _iframeElement.style.border = 'none';

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iframeElement,
    );

    _iframeWidget = HtmlElementView(
      key: UniqueKey(),
      viewType: 'iframeElement',
    );
  }

  @override
  Widget build(BuildContext context) {
    final _width = _screenQueries.customWidthPercent(context, 0.75);
    final _height = _screenQueries.customHeightPercent(context, 0.75);

    return Container(
      color: const Color(0xffF7F9FF),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: _iframeWidget,
      ),
    );
  }
}

class Team extends StatelessWidget {
  const Team({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: const Text(
                'OUR TEAM',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      ClipOval(
                        child: Image.asset('assets/avatar/gene.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          'Gene Yllanes',
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      ClipOval(
                        child: Image.asset('assets/avatar/mahmoud.jpeg'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          'Mahmoud Garwallane',
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      ClipOval(
                        child: Image.asset('assets/avatar/anna.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          'Anna Muzykina',
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
