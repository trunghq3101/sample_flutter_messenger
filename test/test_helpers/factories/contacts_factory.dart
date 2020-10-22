import 'package:faker/faker.dart';
import 'package:sample_flutter_messenger/model/contact.dart';

class ContactsFactory {
  List<Contact> buildList({int number = 5}) {
    List<Contact> contacts = new List(number);
    for (int i = 0; i < number; i++) {
      contacts[i] = Contact(
          id: i.toString(),
          name: Faker().person.name(),
          avatarUrl: Faker().internet.httpsUrl(),
          lastOnline:
              Faker().date.dateTime(minYear: 2019, maxYear: 2019).second);
    }
    return contacts;
  }
}
