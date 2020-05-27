import 'package:chatapp/models/user_model.dart';

import 'message_model.dart';

class ConversationModel {
  int id;
  UserModal user;
  String createdAt;
  List<MessageModal> messages;

  ConversationModel({this.id, this.user, this.createdAt, this.messages});

  ConversationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new UserModal.fromJson(json['user']) : null;
    createdAt = json['created_at'];
    if (json['messages'] != null) {
      messages = new List<MessageModal>();
      json['messages'].forEach((v) {
        messages.add(new MessageModal.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['created_at'] = this.createdAt;
    if (this.messages != null) {
      data['messages'] = this.messages.map((v) => v.toJson()).toList();
    }
    return data;
  }
}