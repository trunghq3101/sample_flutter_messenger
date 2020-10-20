import 'package:flutter/material.dart';
import 'package:sample_flutter_messenger/keys.dart';

import 'app_icons.dart';

class BottomBar extends StatelessWidget {
  final int activeIndex;
  final ValueChanged<int> onClicked;

  BottomBar({@required this.activeIndex, @required this.onClicked});

  bool _isSelected(index) => activeIndex == index;

  @override
  Widget build(BuildContext context) => Container(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BottomBarItem(
              index: 0,
              icon: AppIcons.chats,
              isSelected: _isSelected(0),
              onClicked: onClicked,
            ),
            BottomBarItem(
                index: 1,
                icon: AppIcons.calls,
                isSelected: _isSelected(1),
                onClicked: onClicked),
            BottomBarItem(
                index: 2,
                icon: AppIcons.contacts,
                isSelected: _isSelected(2),
                onClicked: onClicked),
            BottomBarItem(
                index: 3,
                icon: Icons.settings,
                isSelected: _isSelected(3),
                onClicked: onClicked),
            Ink(
                decoration: ShapeDecoration(
                  color: Colors.black,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  key: Key(Keys.NEW_ACTION_BTN),
                  icon: Icon(Icons.add),
                  iconSize: 16,
                  color: Colors.white,
                  onPressed: () => onClicked(4),
                ))
          ],
        ),
      );
}

class BottomBarItem extends StatelessWidget {
  final IconData icon;
  final int index;
  final bool isSelected;
  final ValueChanged<int> onClicked;

  BottomBarItem({this.index, this.icon, this.isSelected, this.onClicked});

  @override
  Widget build(BuildContext context) {
    var color = isSelected ? Colors.black : Colors.black26;
    return IconButton(
        icon: Icon(icon),
        onPressed: () {
          onClicked(index);
        },
        iconSize: 16,
        color: color);
  }
}
