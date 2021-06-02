import 'dart:async';
import 'package:be_notified/App/login_screen.dart';
import 'package:be_notified/model/slide.dart';
import 'package:be_notified/widgets/slide_dot.dart';
import 'package:be_notified/widgets/slide_item.dart';
import 'package:flutter/material.dart';
class GetStartedScreen extends StatefulWidget {
  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(
    initialPage: 0
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer){
      if(_currentPage < 3){
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }
_onPageChanged(int index){
    setState(() {
      _currentPage = index;
    });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children:<Widget>[
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget> [
                    PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      onPageChanged: _onPageChanged,
                      itemCount: slideList.length ,
                      itemBuilder: (ctx, i) => SlideItem(index: i),
                    ),
                    Stack(
                      alignment: AlignmentDirectional.topStart,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(bottom: 35),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              for(int i = 0; i < slideList.length; i++)
                                if( i == _currentPage)
                                  SlideDots(true)
                                else
                                  SlideDots(false)

                            ],
                          ) ,
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height:20,),

                SizedBox(
                  width: 200,
                  child: RaisedButton(
                    child:Text('Get Started' ,
                        style:TextStyle(fontSize: 18,
                        )),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding: const EdgeInsets.all(15),
                    color:Color(0xFFDB3942),
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.of(context).pushNamed(LoginScreen.routeName);
                    },
                  ),
                ),
              SizedBox(height: 100,),
            ],
          ),
        ),
      ),
    );
  }
}

