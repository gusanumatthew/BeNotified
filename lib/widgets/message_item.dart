import 'package:be_notified/model/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageItem extends StatelessWidget {
  final int index;

  MessageItem({required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                messageList[index].day,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: 490,
                child: FittedBox(
                  child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color(0x306C7779),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 490,
                          height: 200,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24.0),
                              topRight: Radius.circular(24.0),
                            ),
                            child: Image.asset(
                              messageList[index].imageUrl,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        // SizedBox(height:20 ,),
                        Container(
                          padding: EdgeInsets.all(24),
                          width: 490,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                messageList[index].title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              SizedBox(height: 16),
                              Text(messageList[index].desc),
                              SizedBox(height: 16),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.watch_later_outlined,
                                        color: Colors.black54,
                                      ),
                                      SizedBox(width: 8),
                                      Text(messageList[index].time),
                                    ],
                                  ),
                                  SizedBox(width: 16),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.date_range_outlined,
                                        color: Colors.black54,
                                      ),
                                      SizedBox(width: 8),
                                      Text(messageList[index].date),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
