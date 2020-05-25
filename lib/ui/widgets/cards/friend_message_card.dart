import 'package:chatapp/ui/style.dart';
import 'package:flutter/material.dart';

class FriendMessageCard extends StatelessWidget {
  const FriendMessageCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(
                'http://w3schools.fzxgj.top/Static/Picture/img_avatar3.png'),
          ),
          SizedBox(width: 12,),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(21),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Style.primaryColor,
                        Style.secondaryColor,
                        Style.secondaryColor,
                        Style.secondaryColor,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(21),
                    topRight: Radius.circular(21),
                    bottomRight: Radius.circular(21),
                  )),
              child: Text("This is lorem message"),
            ),
          )
        ],
      ),
    );
  }
}