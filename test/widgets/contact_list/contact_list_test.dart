import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sample_flutter_messenger/data/contacts_repository.dart';
import 'package:sample_flutter_messenger/di/module_container.dart';
import 'package:sample_flutter_messenger/model/contact.dart';
import 'package:sample_flutter_messenger/widgets/contact_list/contact_item.dart';
import 'package:sample_flutter_messenger/widgets/contact_list/contact_list.dart';

import '../../test_helpers/factories/contacts_factory.dart';
import '../../test_helpers/mocks.dart';
import '../../test_helpers/testable_widget.dart';

void main() {
  group('Contact List', () {
    ContactsRepository mockContactsRepository;
    List<Contact> contacts;

    setUp(() {
      HttpOverrides.global = TestHttpOverrides();
      mockContactsRepository = MockContactsRepository();
      ModuleContainer().registerContactsRepository(mockContactsRepository);
    });

    group('When load contacts successfully', () {
      testWidgets('It should shows the list', (WidgetTester tester) async {
        contacts = ContactsFactory().buildList();
        when(mockContactsRepository.getContacts())
            .thenAnswer((_) => Future.value(contacts));
        await tester.pumpWidget(
          testableWidget(widgetUnderTest: ContactList()),
        );
        await tester.pumpAndSettle();
        expect(find.byType(ContactItem), findsNWidgets(contacts.length));
        contacts.forEach((contact) {
          WidgetPredicate contactPredicate = (Widget widget) =>
              widget.key == Key(contact.id) &&
              widget is ContactItem &&
              widget.contact == contact;
          expect(find.byWidgetPredicate(contactPredicate), findsOneWidget);
        });
      });
    });

    group('When load contacts fail', () {
      testWidgets('It should shows error text', (WidgetTester tester) async {
        when(mockContactsRepository.getContacts())
            .thenAnswer((_) => Future.error('Some error'));
        await tester.pumpWidget(
          testableWidget(widgetUnderTest: ContactList()),
        );
        await tester.pumpAndSettle();
        expect(find.text('Some error'), findsOneWidget);
      });
    });
  });
}
