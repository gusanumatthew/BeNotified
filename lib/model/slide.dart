import 'package:flutter/material.dart';

class Slide{
  final String imageUrl;
  final String title;
  final String tit;
  final String desc;

  Slide({
    @required this.imageUrl,
    @required this.title,
    this.tit,
    @required this.desc,
  });
}

final slideList = [
  Slide(
      imageUrl: 'images/slide 1.jpg',
      title: 'Welcome To Be',
      tit: 'Notified',
      desc: 'Take a step to get connected and never loose informations with BeNotified.',
  ),
  Slide(
    imageUrl: 'images/slide 2.jpg',
    title: 'Easy Access',
    tit: '',
    desc: 'A digital notice board,An innovative way to get informations from Authorities',
  ),
  Slide(
    imageUrl: 'images/slide 3.jpg',
    title: 'Notification Made Easier',
    tit: '',
    desc: 'Information at your fingertips,get connected anytime, anyday ',
  ),
  Slide(
    imageUrl: 'images/slide 4.jpg',
    title: 'Stay Connected',
    tit: '',
    desc: 'Moveable digital notice board get notified anywhere',
  ),
];
