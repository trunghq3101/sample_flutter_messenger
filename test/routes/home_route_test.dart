import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sample_flutter_messenger/routes/home_route.dart';
import 'package:sample_flutter_messenger/routes/new_chat_route.dart';
import 'package:sample_flutter_messenger/widgets/app_icons.dart';

import '../mock_navigator_observer.dart';

void main() {
  group('Home Route', () {
    NavigatorObserver mockObserver;
    setUp(() {
      mockObserver = MockNavigatorObserver();
    });

    testWidgets('It shows bottom bar', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: HomeRoute(),
      ));

      expect(find.byIcon(AppIcons.chats), findsOneWidget);
      expect(find.byIcon(AppIcons.calls), findsOneWidget);
      expect(find.byIcon(AppIcons.contacts), findsOneWidget);
      expect(find.byIcon(Icons.settings), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('When user taps on Chats tab, it shows Chats screen',
            (WidgetTester tester) async {
          await tester.pumpWidget(MaterialApp(
            home: HomeRoute(),
          ));
          await tester.tap(find.byIcon(AppIcons.chats));
          await tester.pump();

          expect(find.text('Chats'), findsOneWidget);
        });

    testWidgets('When user taps on Calls tab, it shows Calls screen',
            (WidgetTester tester) async {
          await tester.pumpWidget(MaterialApp(
            home: HomeRoute(),
          ));
          await tester.tap(find.byIcon(AppIcons.calls));
          await tester.pump();

          expect(find.text('Calls'), findsOneWidget);
        });

    testWidgets('When user taps on Contacts tab, it shows Contacts screen',
            (WidgetTester tester) async {
          await tester.pumpWidget(MaterialApp(
            home: HomeRoute(),
          ));
          await tester.tap(find.byIcon(AppIcons.contacts));
          await tester.pump();

          expect(find.text('Contacts'), findsOneWidget);
        });

    testWidgets('When user taps on Settings tab, it shows Settings screen',
            (WidgetTester tester) async {
          await tester.pumpWidget(MaterialApp(
            home: HomeRoute(),
          ));
          await tester.tap(find.byIcon(Icons.settings));
          await tester.pump();

          expect(find.text('Settings'), findsOneWidget);
        });

    testWidgets(
        'When user taps on New action tab, it navigate to New chat '
            'screen', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: HomeRoute(),
        navigatorObservers: [mockObserver],
      ));
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      verify(mockObserver.didPush(any, any));
      expect(find.byType(NewChatRoute), findsOneWidget);
    });
  });
}
