import 'package:flutter/material.dart';

import '../../colors.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(36, 28, 36, 32),
      padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      decoration: ShapeDecoration(
          color: AppColors.INPUT_BOX_COLOR,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(100)))),
      child: Row(
        children: [
          Icon(Icons.search),
          Container(
            margin: EdgeInsets.only(left: 12),
            child: Text(
              'Search',
              style: TextStyle(color: AppColors.UNSELECTED_COLOR),
            ),
          )
        ],
      ),
    );
  }
}
