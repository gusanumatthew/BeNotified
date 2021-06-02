import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TriggerModal extends StatelessWidget {
  //About BeNotified bottomSheet
  _aboutBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Be',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Notified',
                        style: TextStyle(
                            color: Color(0xFFDB3942),
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Divider(
                    height: 16,
                    color: Colors.black54,
                  ),
                  Text(
                      "Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
                  SizedBox(
                    height: 16,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Developer Contact'),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.email,
                            color: Colors.black54,
                          ),
                          SizedBox(width: 8),
                          Text('Email : contact@benotified.com'),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.black54,
                          ),
                          SizedBox(width: 8),
                          Text('Address : Benotified inc. Ibadan,Oyo State'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
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
                    Icons.timer_outlined,
                    size: 29,
                    color: Color(0xFFDB3942),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text('About BeNotified',
                    style: TextStyle(
                      fontSize: 18,
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 29,
                color: Color(0xFFDB3942),
              ),
            )
          ],
        ),
      ),
      onPressed: () {
        _aboutBottomSheet(context);
      },
    );
  }
}

class EditModal extends StatefulWidget {
  //Edit Profile
  @override
  _EditModalState createState() => _EditModalState();
}

class _EditModalState extends State<EditModal> {
  _editProfileBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: ListView(
              padding: EdgeInsets.all(32),
              children: <Widget>[
                Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(
                  height: 16,
                  color: Colors.black54,
                  thickness: 2,
                ),
                Column(
                  children: [
                    _image == null
                        ? Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                            child: Stack(children: <Widget>[
                              CircleAvatar(
                                radius: 70,
                                child: ClipOval(
                                  child: Image.asset(
                                    'images/name.jpeg',
                                    height: 150,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 1,
                                right: 1,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.add_a_photo_outlined,
                                      color: Colors.white,
                                    ),
                                    onPressed: getImage,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFDB3942),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                ),
                              ),
                            ]),
                          )
                        : Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                            child: Stack(children: <Widget>[
                              CircleAvatar(
                                radius: 70,
                                child: ClipOval(
                                  child: Image.file(
                                    _image,
                                    height: 150,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 1,
                                right: 1,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.add_a_photo_outlined,
                                      color: Colors.white,
                                    ),
                                    onPressed: getImage,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFDB3942),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Full Name',
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.all(8),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Phone Number',
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.all(8),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'johndoe@benotified',
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.all(8),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                RaisedButton(
                    child: Text(
                      'Update Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding: const EdgeInsets.all(15),
                    color: Color(0xFFDB3942),
                    onPressed: () {})
              ],
            ),
          );
        });
  }

  File _image;

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
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
                    Icons.person_outline,
                    size: 29,
                    color: Color(0xFFDB3942),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text('Edit Profile',
                    style: TextStyle(
                      fontSize: 18,
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 29,
                color: Color(0xFFDB3942),
              ),
            )
          ],
        ),
      ),
      onPressed: () {
        _editProfileBottomSheet(context);
      },
    );
  }
}
