import 'package:chatapp/models/message_model.dart';
import 'package:flutter/material.dart';

import '../../style.dart';

class MyMessageCard extends StatelessWidget {
  final MessageModal message;
  const MyMessageCard({
    Key key, this.message,
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
              child: Text("${message.body}"),
            ),
          ),
        ],
      ),
    );
  }
}