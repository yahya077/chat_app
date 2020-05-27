import 'package:chatapp/models/conversation_model.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class ConversationCard extends StatelessWidget {
  final ConversationModel conversation;
  final Function onTap;
  const ConversationCard({
    Key key, this.onTap, this.conversation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: ClipOval(child: Image.network(conversation.user.imageUrl != null ? '${conversation.user.imageUrl}' :
      'http://w3schools.fzxgj.top/Static/Picture/img_avatar3.png')),
      title: Text(conversation.user.name, style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 18),),
      subtitle: Text(conversation.messages.last.body, style: TextStyle(color: Colors.white.withOpacity(0.4)),),
      trailing: Text(Jiffy(conversation.messages.last.createdAt).fromNow(), style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 13),),
    );
  }
}