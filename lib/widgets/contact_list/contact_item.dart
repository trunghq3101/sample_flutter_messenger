import 'package:flutter/material.dart';
import 'package:sample_flutter_messenger/model/contact.dart';

class ContactItem extends StatelessWidget {
  final Contact contact;

  const ContactItem({Key key, this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
      key: key,
      contentPadding: EdgeInsets.only(left: 36.0, bottom: 24.0),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(contact.avatarUrl),
      ),
      title: Text(
        contact.name,
        style: Theme.of(context).textTheme.headline3,
      ),
      subtitle: Text(contact.getLastSeenText()));
}
