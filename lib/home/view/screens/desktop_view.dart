import 'dart:html';
import 'dart:math';
import 'dart:ui' as ui;
import 'package:l2t_alpha/navigation/navbar/navbar.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class DesktopView extends StatefulWidget {
  static Page page() => MaterialPage<void>(child: DesktopView());

  @override
  _DesktopViewState createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      body: ListView(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const HeroSection(),
          const IssueSection(),
          const SolutionSection(),
          const WorksSection(),
          GoogleiFrame(),
          const Team()
        ],
      ),
      extendBodyBehindAppBar: true,
    );
  }
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
                  child: Image.asset('assets/logo/$rand.png'),
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

class HeroBackupSection extends StatelessWidget {
  const HeroBackupSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        child: Image.asset('assets/logo/0.png', fit: BoxFit.fitHeight));
  }
}

class GoogleiFrame extends StatelessWidget {
  GoogleiFrame({Key? key}) : super(key: key);
  final IFrameElement _iFrameElement = IFrameElement();
  @override
  Widget build(BuildContext context) {
    _iFrameElement.height = '569';
    // ignore: cascade_invocations
    _iFrameElement.width = '960';
    // ignore: cascade_invocations
    _iFrameElement.src =
        'https://docs.google.com/presentation/d/e/2PACX-1vQNxaKCaGndGsGFnW61b6LbhRWAY1DhM9DLbGsVc7zuDErNj--a6zVJoueves7vzIppHx9Cr6dh8ysT/embed?start=false&loop=false&delayms=10000';
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iFrameElement,
    );
    Widget _iframeWidget;
    _iframeWidget = HtmlElementView(
      key: UniqueKey(),
      viewType: 'iframeElement',
    );
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
 // <iframe src="https://docs.google.com/presentation/d/e/2PACX-1vQNxaKCaGndGsGFnW61b6LbhRWAY1DhM9DLbGsVc7zuDErNj--a6zVJoueves7vzIppHx9Cr6dh8ysT/embed?start=false&loop=false&delayms=10000" frameborder="0" width="960" height="569" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>