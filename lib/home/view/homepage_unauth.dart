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
      body: ListView(
        children: [
          const FirstSection(),
          const SecondSection(),
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

    image0 = Image.asset('assets/logo/0.png');
    image1 = Image.asset('assets/logo/1.png');
    image2 = Image.asset('assets/logo/2.png');
    image3 = Image.asset('assets/logo/3.png');
    image4 = Image.asset('assets/logo/4.png');
    image5 = Image.asset('assets/logo/5.png');
    image6 = Image.asset('assets/logo/6.png');
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
    print('prechade went very well');
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          height: MediaQuery.of(context).size.height,
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

  final String TheIssueText =
      'True experts are constantly learning, and our product agency found many companies overloaded with work and not enough talent to complete it. Meanwhile, there are many early-career professionals out there with great promise and not enough experience. As we iterated upon feature-based delivery, we found our experts generating more experts, and we learned how teaching-to-learn can culture innovation.';
  final String SolutionText =
      'Empowering innovation & up-skilling through scalable feature-based delivery • Have a product you want to build? Our experts can build it for you, or they can teach you the business, design, and/or development through a real-life product so that you can teach others when building your own.';
  final String number1Text =
      "Whether you want us to build your vision, or you want to learn how to build it yourself, the first step is to get matched with a team that best suits your needs";
  final String number2Text =
      "As you work with our team you will be exposed to the state-of-the-art tools and approaches for building, delivering, and maintaining products.";
  final String number3Text =
      "Whether you'd like to continue having your product built for you, or you'd like to start building your own, we can support your next steps";
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 2,
      color: Colors.white,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 50),
          child: Text(
            'ABOUT OUR PROJECT',
            style: TextStyle(
                fontFamily: 'Kreon',
                fontWeight: FontWeight.bold,
                fontSize: 36,
                color: Color(0xffF4BD62)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: Row(
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
              Text('ISSUE',
                  style: const TextStyle(
                      fontFamily: 'Kreon',
                      fontWeight: FontWeight.bold,
                      fontSize: 82,
                      color: Color(0xff000000)))
            ],
          ),
        ),
        Container(
            width: MediaQuery.of(context).size.width / 1.7,
            child: SelectableText(
              TheIssueText,
              style: TextStyle(
                fontSize: 23,
              ),
            )),
        Divider(
          indent: MediaQuery.of(context).size.width / 5,
          endIndent: MediaQuery.of(context).size.width / 5,
          thickness: 2,
          height: 100,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('OUR MAGIC\n SOLUTION',
                style: TextStyle(
                    fontFamily: 'Kreon',
                    fontWeight: FontWeight.bold,
                    fontSize: 55,
                    color: Color(0xff000000))),
            Container(
                padding: EdgeInsets.only(left: 20),
                width: MediaQuery.of(context).size.width / 3,
                child: SelectableText(
                  SolutionText,
                  style: TextStyle(
                    fontSize: 23,
                  ),
                )),
          ],
        ),
        Divider(
          indent: MediaQuery.of(context).size.width / 5,
          endIndent: MediaQuery.of(context).size.width / 5,
          thickness: 2,
          height: 100,
        ),
        Text('HOW IT WORKS',
            style: TextStyle(
                fontFamily: 'Kreon',
                fontWeight: FontWeight.bold,
                fontSize: 60,
                color: Color(0xff000000))),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(
                      color: const Color(0xffEF9D13),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text('1',
                          style: TextStyle(
                              fontFamily: 'Kreon',
                              fontWeight: FontWeight.bold,
                              fontSize: 115,
                              color: Color(0xffFFFFFF))),
                    ),
                  ),
                  Text("Bring us your ideas",
                      style: TextStyle(fontSize: 20, color: Color(0xff000000))),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width / 5,
                      child: SelectableText(
                        number1Text,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 17,
                        ),
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
                    decoration: BoxDecoration(
                      color: const Color(0xffEF9D13),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text('2',
                          style: TextStyle(
                              fontFamily: 'Kreon',
                              fontWeight: FontWeight.bold,
                              fontSize: 115,
                              color: Color(0xffFFFFFF))),
                    ),
                  ),
                  Text("Collaborate",
                      style: TextStyle(fontSize: 20, color: Color(0xff000000))),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width / 5,
                      child: SelectableText(
                        number2Text,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ))
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
                    decoration: BoxDecoration(
                      color: const Color(0xffEF9D13),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text('3',
                          style: TextStyle(
                              fontFamily: 'Kreon',
                              fontWeight: FontWeight.bold,
                              fontSize: 115,
                              color: Color(0xffFFFFFF))),
                    ),
                  ),
                  Text("Grow",
                      style: TextStyle(fontSize: 20, color: Color(0xff000000))),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width / 5,
                      child: SelectableText(
                        number1Text,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ))
                ],
              ),
            )
          ],
        )
      ]),
    );
  }
}

// class SecondSection extends StatelessWidget {
//   const SecondSection({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//           height: 1000,
//           // color: const Color(0xffF7F9FF),
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               // crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Container(child: Image.asset('assets/hero.png')),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 80.0),
//                   child: Text('Learn how to build your vision',
//                       textAlign: TextAlign.center,
//                       style: Theme.of(context)
//                           .primaryTextTheme
//                           .headline1!
//                           .copyWith(fontSize: 50)),
//                 )
//               ],
//             ),
//           )),
//     );
//   }
// }

