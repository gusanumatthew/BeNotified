import 'package:be_notified/contents/constants/styles.dart';
import 'package:flutter/material.dart';
class Bullet extends StatelessWidget {
  const Bullet({
     Key? key,
    required this.leading,
    required this.title, 
     }) : super(key: key);
       final IconData leading;
       final String title;
  @override
  Widget build(BuildContext context) {
    return new ListTile(
                    leading: Icon(leading,
                    size: 16),
                   title: new Text(title,
                   style: AppStyles.bodyText,),
                  
    );
  }
}