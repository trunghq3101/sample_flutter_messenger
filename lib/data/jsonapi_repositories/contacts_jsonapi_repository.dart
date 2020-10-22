import 'package:json_api/client.dart';
import 'package:sample_flutter_messenger/data/contacts_repository.dart';
import 'package:sample_flutter_messenger/data/jsonapi_repositories/resources.dart';
import 'package:sample_flutter_messenger/model/contact.dart';
import 'package:sample_flutter_messenger/strings.dart';

class ContactsJsonApi implements ContactsRepository {
  final RoutingClient _routingClient;

  ContactsJsonApi(this._routingClient);

  @override
  Future<List<Contact>> getContacts() async {
    final response = await _routingClient.fetchCollection(Resources.CONTACTS);
    if (response.statusCode == 200) {
      final data = response.data
          .unwrap()
          .map((e) => Contact.fromResource(e))
          .toList(growable: false);
      data.sort((item1, item2) => item1.name.compareTo(item2.name));
      return Future.value(data);
    } else {
      throw Strings.LOAD_CONTACTS_FAILED;
    }
  }
}
