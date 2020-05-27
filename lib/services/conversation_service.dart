import 'dart:convert';

import 'package:chatapp/models/message_model.dart';
import 'package:dio/dio.dart';

import 'base_api.dart';
import 'package:http/http.dart' as http;

class ConversationService extends BaseApi {
  Future<Response> getConversation() async {
    return await api.httpGet('conversations');
  }

  Future<Response> storeMessage(MessageModal message) async {
    return await api.httpPost('messages', {'body': message.body,'conversation_id' : message.conversationId});
  }
}