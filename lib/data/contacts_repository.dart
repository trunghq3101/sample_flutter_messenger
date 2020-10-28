import 'dart:core';

import 'package:sample_flutter_messenger/model/contact.dart';

abstract class ContactsRepository {
  Future<List<Contact>> getContacts();
}
