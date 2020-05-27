
import 'dart:convert';

import 'package:chatapp/models/conversation_model.dart';
import 'package:chatapp/models/message_model.dart';
import 'package:chatapp/providers/base_provider.dart';
import 'package:chatapp/services/conversation_service.dart';


class ConversationProvider extends BaseProvider {
  ConversationService _conversationService = ConversationService();
  List<ConversationModel> _conversations = List();
  List<ConversationModel> get conversations => _conversations;

  Future<List<ConversationModel>> getConversations() async {
    setBusy(true);
    var response = await _conversationService.getConversation();
    if(response.statusCode == 200) {
      var data = jsonDecode(response.toString());
      data['data'].forEach((conversations) =>
          _conversations.add(ConversationModel.fromJson(conversations)));
      print(response.toString());
      notifyListeners();
      setBusy(false);
    }else if (response.statusCode == 404){
      setMessage(response.toString());
    }
    return _conversations;
  }

  Future<MessageModal> storeMessage(MessageModal message) async {
    setBusy(true);
    var response = await _conversationService.storeMessage(message);
    if(response.statusCode == 201) {
      var data = jsonDecode(response.toString());
      notifyListeners();
      setBusy(false);
      return MessageModal.fromJson(data['data']);
    }
    setBusy(false);
    return null;
  }
}