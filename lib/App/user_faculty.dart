import 'package:be_notified/model/message.dart';
import 'package:be_notified/widgets/message_item.dart';
import 'package:flutter/material.dart';

class Faculty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Faculty'),
        backgroundColor: Color(0xFF8F0009),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: messageList.length,
        itemBuilder: (ctx, i) => MessageItem(index: i),
      ),
    );
  }
}
