import 'package:flutter/material.dart';
import 'package:sample_flutter_messenger/data/contacts_repository.dart';
import 'package:sample_flutter_messenger/di/module_container.dart';
import 'package:sample_flutter_messenger/model/contact.dart';
import 'package:sample_flutter_messenger/widgets/contact_list/contact_item.dart';

class ContactList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  Future<List<Contact>> contacts;

  @override
  void initState() {
    super.initState();
    contacts = ModuleContainer().get<ContactsRepository>().getContacts();
  }

  @override
  Widget build(BuildContext context) => Center(
        child: FutureBuilder<List<Contact>>(
          future: contacts,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: snapshot.data
                    .map((contact) => ContactItem(
                          key: Key(contact.id),
                          contact: contact,
                        ))
                    .toList(growable: false),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            return CircularProgressIndicator();
          },
        ),
      );
}
