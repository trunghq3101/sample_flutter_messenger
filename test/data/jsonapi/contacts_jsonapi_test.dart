import 'package:faker/faker.dart';
import 'package:json_api/client.dart';
import 'package:json_api/document.dart';
import 'package:mockito/mockito.dart';
import 'package:sample_flutter_messenger/data/jsonapi_repositories/contacts_jsonapi_repository.dart';
import 'package:sample_flutter_messenger/data/jsonapi_repositories/resources.dart';
import 'package:sample_flutter_messenger/model/contact.dart';
import 'package:sample_flutter_messenger/strings.dart';
import 'package:test/test.dart';

import '../../test_helpers/mocks.dart';

void main() {
  group('Contacts Json API', () {
    RoutingClient mockRoutingClient;

    group('When get contacts successfully', () {
      var contacts = [
        {
          "id": Faker().lorem.word(),
          "type": Resources.CONTACTS,
          "attributes": {
            "name": "b",
            "avatar-url": Faker().internet.httpsUrl(),
            "last-online": Faker().date.dateTime().second
          }
        },
        {
          "id": Faker().lorem.word(),
          "type": Resources.CONTACTS,
          "attributes": {
            "name": "a",
            "avatar-url": Faker().internet.httpsUrl(),
            "last-online": Faker().date.dateTime().second
          }
        }
      ];
      setUp(() {
        mockRoutingClient = MockRoutingClient();
      });

      test(
          'It should returns a list of contacts with names ordered by alphabet',
          () async {
        ContactsJsonApi api = ContactsJsonApi(mockRoutingClient);
        when(mockRoutingClient.fetchCollection(Resources.CONTACTS)).thenAnswer(
            (_) => Future.value(Response(200, {},
                document: Document(ResourceCollectionData(
                    contacts.map((e) => ResourceObject.fromJson(e)))))));

        List<Contact> result = await api.getContacts();

        expect(result.length, equals(2));
        expect(result[0].name, equals('a'));
        expect(result[1].name, equals('b'));
      });
    });

    group('When get contacts fail', () {
      setUp(() {
        mockRoutingClient = MockRoutingClient();
      });

      test('It should throw exception', () async {
        ContactsJsonApi api = ContactsJsonApi(mockRoutingClient);
        when(mockRoutingClient.fetchCollection(Resources.CONTACTS))
            .thenAnswer((_) => Future.value(Response(400, {})));

        try {
          await api.getContacts();
        } catch (e) {
          expect(e, equals(Strings.LOAD_CONTACTS_FAILED));
          return;
        }
        fail("Not throwing exception");
      });
    });
  });
}
