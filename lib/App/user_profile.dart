import 'package:be_notified/widgets/trigger_modal.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        backgroundColor: Color(0xFF8F0009),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('images/name.jpeg'),
              radius: 70,
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                ''
                'Gusanu Matthew',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                'gusanum5@gmail.com',
                style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Theme(
              data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
              child: EditModal(),
            ),
            SizedBox(
              height: 20,
            ),
            Theme(
              data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
              child: TriggerModal(),
            ),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Colors.grey[200],
                ),
                height: 50,
                width: 500,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Icon(
                            Icons.logout,
                            size: 29,
                            color: Color(0xFFDB3942),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text('Logout',
                            style: TextStyle(
                              fontSize: 18,
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Opacity(
                        opacity: 0.0,
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 29,
                          color: Color(0xFFDB3942),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
