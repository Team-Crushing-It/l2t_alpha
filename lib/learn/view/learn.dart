import 'package:flutter/material.dart';
import 'package:l2t_alpha/navigation/navbar/navbar.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter/services.dart';

class Learn extends StatelessWidget {
  static Page page() => MaterialPage<void>(child: Learn());

  Future<String> getData() async =>
      await rootBundle.loadString('/markdown_test_page.md');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      body: Center(
        child: FutureBuilder(
          future: getData(),
          builder: (context, AsyncSnapshot<String> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  Expanded(
                    child: Markdown(
                      data: snapshot.data!,
                      imageDirectory: 'https://raw.githubusercontent.com',
                    ),
                  )
                ],
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
