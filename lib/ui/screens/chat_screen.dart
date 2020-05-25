import 'package:chatapp/ui/size_config.dart';
import 'package:chatapp/ui/style.dart';
import 'package:chatapp/ui/widgets/cards/friend_message_card.dart';
import 'package:chatapp/ui/widgets/cards/my_message_card.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_){
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Style.darkColor,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text('Friend Name'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
              child: ListView(
                controller: _scrollController,
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal * 3,
                vertical: SizeConfig.safeBlockHorizontal * 3),
            children: <Widget>[
              FriendMessageCard(),
              FriendMessageCard(),
              MyMessageCard(),
              FriendMessageCard(),
              MyMessageCard(),
              MyMessageCard(),
              FriendMessageCard(),
              MyMessageCard(),
            ],
          )),
          Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Style.darkColor,
                borderRadius: BorderRadius.circular(32)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Type your message...',
                        hintStyle: TextStyle()),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(colors: [
                      Style.primaryColor,
                      Style.secondaryColor,
                      Style.secondaryColor,
                      Style.secondaryColor,
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  ),
                  child: Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


