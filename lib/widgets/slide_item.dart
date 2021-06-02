import 'package:be_notified/model/slide.dart';
import 'package:flutter/material.dart';
class SlideItem extends StatelessWidget {
  final int index;
  SlideItem({this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
    child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(slideList[index].imageUrl,width: 250, height: 250,),
          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(slideList[index].title,
                style:TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                ),),

              Text(slideList[index].tit ,
                style:
                TextStyle(
                    color: Color(0xFFDB3942),
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                ),
              ),
            ],
          ),
          SizedBox(height: 15,),
          Text(slideList[index].desc ,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
