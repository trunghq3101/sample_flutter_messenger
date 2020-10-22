import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sample_flutter_messenger/app_icons.dart';
import 'package:sample_flutter_messenger/data/contacts_repository.dart';
import 'package:sample_flutter_messenger/di/module_container.dart';
import 'package:sample_flutter_messenger/helper/app_navigator.dart';
import 'package:sample_flutter_messenger/model/contact.dart';
import 'package:sample_flutter_messenger/routes/new_action/new_action_route.dart';
import 'package:sample_flutter_messenger/widgets/contact_list/contact_list.dart';

import '../test_helpers/mocks.dart';

void main() {
  group('New Action Route', () {
    AppNavigator mockAppNavigator;
    ContactsRepository mockContactsRepository;
    List<Contact> contacts;

    setUp(() {
      mockAppNavigator = MockAppNavigator();
      mockContactsRepository = MockContactsRepository();
      ModuleContainer().registerAppNavigator(mockAppNavigator);
      ModuleContainer().registerContactsRepository(mockContactsRepository);
      contacts = [];
    });

    testWidgets('When shows up, it shows New Message screen',
        (WidgetTester tester) async {
      when(mockContactsRepository.getContacts())
          .thenAnswer((_) => Future.value(contacts));
      await tester.pumpWidget(MaterialApp(
        home: NewActionRoute(),
      ));

      expect(find.text('New Message'), findsWidgets);
      expect(find.byType(ContactList), findsOneWidget);
    });

    testWidgets('When clicks on back arrow, it navigate back',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: NewActionRoute()));

      await tester.tap(find.byIcon(Icons.keyboard_arrow_left));

      verify(mockAppNavigator.navigateBack());
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
