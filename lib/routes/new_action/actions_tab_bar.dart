import 'package:flutter/material.dart';
import 'package:sample_flutter_messenger/app_icons.dart';
import 'package:sample_flutter_messenger/keys.dart';

import '../../colors.dart';
import '../../sizes.dart';

class ActionsTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 36.0, right: 36.0),
      child: TabBar(
        indicatorColor: Colors.transparent,
        unselectedLabelColor: AppColors.UNSELECTED_COLOR,
        tabs: [
          Tab(
              key: Key(Keys.TAB_CHATS),
              icon: Icon(AppIcons.chats, size: AppSizes.ICON)),
          Tab(
              key: Key(Keys.TAB_ENCRYPTED),
              icon: Icon(AppIcons.encrypted, size: AppSizes.ICON)),
          Tab(
              key: Key(Keys.TAB_CHANNEL),
              icon: Icon(AppIcons.channel, size: AppSizes.ICON)),
          Tab(
              key: Key(Keys.TAB_CALL),
              icon: Icon(AppIcons.calls, size: AppSizes.ICON)),
          Tab(
              key: Key(Keys.TAB_CONTACT),
              icon: Icon(AppIcons.contacts, size: AppSizes.ICON)),
        ],
      ),
    );
  }
}
