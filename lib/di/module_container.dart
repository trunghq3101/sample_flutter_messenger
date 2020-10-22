import 'package:get_it/get_it.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart';
import 'package:json_api/client.dart';
import 'package:json_api/http.dart';
import 'package:json_api/routing.dart';
import 'package:sample_flutter_messenger/data/contacts_repository.dart';
import 'package:sample_flutter_messenger/data/jsonapi_repositories/contacts_jsonapi_repository.dart';
import 'package:sample_flutter_messenger/helper/app_navigator.dart';

class ModuleContainer {
  final getIt = GetIt.instance;

  void initialize() {
    getIt.registerFactory<ContactsRepository>(
        () => ContactsJsonApi(getIt.get<RoutingClient>()));
    getIt.registerFactory<RoutingClient>(() => _buildRoutingClient());
    getIt.registerFactoryParam((context, _) => AppNavigator(context));
  }

  T get<T>({dynamic param1, dynamic param2}) =>
      getIt.get(param1: param1, param2: param2);

  void registerAppNavigator(AppNavigator appNavigator) {
    getIt.allowReassignment = true;
    getIt.registerFactoryParam((context, _) => appNavigator);
  }

  void registerRoutingClient(RoutingClient routingClient) {
    getIt.allowReassignment = true;
    getIt.registerFactory(() => routingClient);
  }

  void registerContactsRepository(ContactsRepository contactsRepository) {
    getIt.allowReassignment = true;
    getIt.registerFactory(() => contactsRepository);
  }

  RoutingClient _buildRoutingClient() {
    final routing =
        StandardRouting(Uri.parse(GlobalConfiguration().getValue('API_URL')));
    final httpHandler = LoggingHttpHandler(DartHttp(Client()),
        onRequest: (r) => print('${r.method} ${r.uri}'),
        onResponse: (r) => print('${r.statusCode} ${r.body}'));
    return RoutingClient(JsonApiClient(httpHandler), routing);
  }
}
