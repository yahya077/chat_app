import 'package:flutter/material.dart';

import '../../style.dart';

class MyMessageCard extends StatelessWidget {
  const MyMessageCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(21),
              decoration: BoxDecoration(
                  color: Style.darkColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(21),
                    topRight: Radius.circular(21),
                    bottomLeft: Radius.circular(21),
                  )),
              child: Text("This is lorem message"),
            ),
          ),
          SizedBox(width: 12,),
          CircleAvatar(
            backgroundImage: NetworkImage(
                'http://w3schools.fzxgj.top/Static/Picture/img_avatar3.png'),
          ),
        ],
      ),
    );
  }
}