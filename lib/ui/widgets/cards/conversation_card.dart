import 'package:flutter/material.dart';

class ConversationCard extends StatelessWidget {
  final Function onTap;
  const ConversationCard({
    Key key, this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: ClipOval(child: Image.network('http://w3schools.fzxgj.top/Static/Picture/img_avatar3.png')),
      title: Text('Yahya', style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 18),),
      subtitle: Text('yo whatsup', style: TextStyle(color: Colors.white.withOpacity(0.4)),),
      trailing: Text('15:09', style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 13),),
    );
  }
}