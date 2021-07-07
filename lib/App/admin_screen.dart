import 'package:be_notified/App/admin_message_screen.dart';
import 'package:be_notified/model/message.dart';
import 'package:be_notified/widgets/message_item.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  static const routeName = '/admin';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin'),
        backgroundColor: Color(0xFF8F0009),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: messageList.length,
        itemBuilder: (ctx, i) => MessageItem(index: i),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.of(context).pushNamed(SendInfoScreen.routeName);
        },
        child: Icon(Icons.message),
        backgroundColor: Color(0xFFDB3942),
      ),
    );
  }
}
