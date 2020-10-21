import 'package:flutter/material.dart';
import 'package:sample_flutter_messenger/colors.dart';
import 'package:sample_flutter_messenger/keys.dart';
import 'package:sample_flutter_messenger/sizes.dart';
import 'package:sample_flutter_messenger/widgets/app_icons.dart';

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
              appBar: AppBar(
                toolbarHeight: 240,
                elevation: 0,
                leading: IconButton(
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
                    children: [
                      TabBar(
                        indicatorColor: Colors.transparent,
                        unselectedLabelColor: AppColors.UNSELECTED_COLOR,
                        tabs: [
                          Tab(icon: Icon(AppIcons.chats, size: AppSizes.ICON)),
                          Tab(
                              icon: Icon(AppIcons.encrypted,
                                  size: AppSizes.ICON)),
                          Tab(
                              icon:
                                  Icon(AppIcons.channel, size: AppSizes.ICON)),
                          Tab(icon: Icon(AppIcons.calls, size: AppSizes.ICON)),
                          Tab(
                              icon:
                                  Icon(AppIcons.contacts, size: AppSizes.ICON)),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.all(32),
                        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        decoration: ShapeDecoration(
                            color: AppColors.INPUT_BOX_COLOR,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)))),
                        child: Row(
                          children: [
                            Icon(Icons.search),
                            Container(
                              margin: EdgeInsets.only(left: 12),
                              child: Text(
                                'Search',
                                style: TextStyle(
                                    color: AppColors.UNSELECTED_COLOR),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              body: TabBarView(
                children: [
                  Text('Chats'),
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

  void _back(context) => Navigator.of(context).pop();

  void _changeTitle(index) {
    setState(() {
      _title = _titles[index];
    });
  }
}
