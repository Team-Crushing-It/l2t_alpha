// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter_test/flutter_test.dart';
import 'package:l2t_alpha/app/app.dart';
import 'package:l2t_alpha/counter/counter.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:l2t_alpha/home/home.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(
          App(authenticationRepository: AuthenticationRepository()));
      expect(find.byType(HomePageUnAuth), findsOneWidget);
    });
  });
}
