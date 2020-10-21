import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sample_flutter_messenger/routes/new_action_route.dart';
import 'package:sample_flutter_messenger/widgets/app_icons.dart';

import '../mock_navigator_observer.dart';

void main() {
  group('New Action Route', () {
    NavigatorObserver mockObserver;
    setUp(() {
      mockObserver = MockNavigatorObserver();
    });

    testWidgets('When shows, it shows New Message screen',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: NewActionRoute(),
      ));

      expect(find.text('New Message'), findsWidgets);
    });

    testWidgets('When clicks on back arrow, it navigate back',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: NewActionRoute(),
        navigatorObservers: [mockObserver],
      ));

      await tester.tap(find.byIcon(Icons.keyboard_arrow_left));
      await tester.pumpAndSettle();

      verify(mockObserver.didPop(any, any));
    });

    testWidgets('When taps on Private tab, it shows New Private screen',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: NewActionRoute(),
      ));
      await tester.tap(find.byIcon(AppIcons.encrypted));
      await tester.pumpAndSettle();

      expect(find.text('New Private Message'), findsWidgets);
    });

    testWidgets('When taps on Channel tab, it shows New Channel screen',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: NewActionRoute(),
      ));
      await tester.tap(find.byIcon(AppIcons.channel));
      await tester.pumpAndSettle();

      expect(find.text('New Channel'), findsWidgets);
    });

    testWidgets('When taps on Call tab, it shows New Call screen',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: NewActionRoute(),
      ));
      await tester.tap(find.byIcon(AppIcons.calls));
      await tester.pumpAndSettle();

      expect(find.text('New Call'), findsWidgets);
    });

    testWidgets('When taps on Contact tab, it shows New Contact screen',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: NewActionRoute(),
      ));
      await tester.tap(find.byIcon(AppIcons.contacts));
      await tester.pumpAndSettle();

      expect(find.text('New Contact'), findsWidgets);
    });
  });
}
