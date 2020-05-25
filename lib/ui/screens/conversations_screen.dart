import 'package:chatapp/ui/size_config.dart';
import 'package:chatapp/ui/widgets/cards/conversation_card.dart';
import 'package:flutter/material.dart';

import '../style.dart';
import 'chat_screen.dart';

class ConversationsScreen extends StatefulWidget {
  @override
  _ConversationsScreenState createState() => _ConversationsScreenState();
}

class _ConversationsScreenState extends State<ConversationsScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Style.darkColor,
      appBar: AppBar(
        backgroundColor: Style.darkColor,
        title: Text('Conversations'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
        ),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
          children: <Widget>[
            ConversationCard(
              onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ChatScreen())),
            ),
            ConversationCard(),
            ConversationCard(),
            ConversationCard(),
            ConversationCard(),
            ConversationCard(),
            ConversationCard(),
            ConversationCard(),
            ConversationCard(),
            ConversationCard(),
            ConversationCard(),
          ],
        ),
      ),
    );
  }
}
