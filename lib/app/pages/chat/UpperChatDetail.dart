import 'package:flutter/cupertino.dart';

class UpperChatDetails {
  String profilePicUrl;
  String username;
  bool isVerified;
  String lastMessage;

  UpperChatDetails(
      this.profilePicUrl, this.username, this.isVerified, this.lastMessage);
}
