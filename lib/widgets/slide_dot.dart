import 'package:flutter/material.dart';
class SlideDots extends StatelessWidget {
  bool isActive;
  SlideDots(this.isActive);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: isActive ? 12 : 12 ,
      width: isActive ? 12 : 12,
      decoration: BoxDecoration(
        color: isActive ? Color(0xFFDB3942) : Color(0xFF9E9E9E),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
