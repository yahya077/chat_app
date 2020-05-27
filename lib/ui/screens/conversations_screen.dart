import 'package:chatapp/providers/auth_provider.dart';
import 'package:chatapp/providers/conversation_provider.dart';
import 'package:chatapp/ui/screens/chat_screen.dart';
import 'package:chatapp/ui/screens/welcome_screen.dart';
import 'package:chatapp/ui/size_config.dart';
import 'package:chatapp/ui/widgets/cards/conversation_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../style.dart';

class ConversationsScreen extends StatefulWidget {
  @override
  _ConversationsScreenState createState() => _ConversationsScreenState();
}

class _ConversationsScreenState extends State<ConversationsScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      Provider.of<ConversationProvider>(context,listen: false).getConversations();
    });
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var provider = Provider.of<ConversationProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Style.darkColor,
      appBar: AppBar(
        backgroundColor: Style.darkColor,
        title: Text('Conversations'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () async {
            Provider.of<AuthProvider>(context,listen: false).logout();
            Navigator.of(context).pushNamedAndRemoveUntil(
                WelcomeScreen.routeName, (Route<dynamic> route) => false);
          },
          icon: Icon(Icons.search),
        ),
      ),
      body: Center(
        child: provider.busy ? CircularProgressIndicator() : ListView.builder(
          padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
          itemCount: provider.conversations.length,
          itemBuilder: (context, index) => ConversationCard(
            conversation: provider.conversations[index],
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => ChatScreen(conversation: provider.conversations[index],))),
          ),
//          children: <Widget>[
//            ConversationCard(
//              onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ChatScreen())),
//            ),
//            ConversationCard(),
//            ConversationCard(),
//            ConversationCard(),
//            ConversationCard(),
//            ConversationCard(),
//            ConversationCard(),
//            ConversationCard(),
//            ConversationCard(),
//            ConversationCard(),
//            ConversationCard(),
//          ],
        ),
      ),
    );
  }
}
