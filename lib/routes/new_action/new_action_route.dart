import 'package:flutter/material.dart';
import 'package:sample_flutter_messenger/di/module_container.dart';
import 'package:sample_flutter_messenger/helper/app_navigator.dart';
import 'package:sample_flutter_messenger/keys.dart';
import 'package:sample_flutter_messenger/routes/new_action/actions_tab_bar.dart';
import 'package:sample_flutter_messenger/routes/new_action/search_bar.dart';
import 'package:sample_flutter_messenger/widgets/contact_list/contact_list.dart';

class NewActionRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewActionRouteState();
}

class _NewActionRouteState extends State<NewActionRoute> {
  List<String> _titles = [
    'New Message',
    'New Private Message',
    'New Channel',
    'New Call',
    'New Contact'
  ];
  String _title = 'New Message';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _titles.length,
        child: Builder(
          builder: (context) {
            final TabController tabController =
                DefaultTabController.of(context);
            tabController.addListener(() {
              _changeTitle(tabController.index);
            });
            return Scaffold(
              backgroundColor: Theme.of(context).backgroundColor,
              appBar: AppBar(
                toolbarHeight: 240,
                leading: IconButton(
                    padding: EdgeInsets.only(left: 24.0),
                    key: Key(Keys.BACK_BTN),
                    icon: Icon(Icons.keyboard_arrow_left),
                    onPressed: () {
                      _back(context);
                    }),
                title: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      _title,
                      style: Theme.of(context).textTheme.headline1,
                    )),
                bottom: PreferredSize(
                  child: Column(
                    children: [ActionsTabBar(), SearchBar()],
                  ),
                ),
              ),
              body: TabBarView(
                children: [
                  ContactList(),
                  Text('Encrypted'),
                  Text('Channel'),
                  Text('Calls'),
                  Text('Contacts'),
                ],
              ),
            );
          },
        ));
  }

  void _back(context) =>
      ModuleContainer().get<AppNavigator>(param1: context).navigateBack();

  void _changeTitle(index) {
    setState(() {
      _title = _titles[index];
    });
  }
}
