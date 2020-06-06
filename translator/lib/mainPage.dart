import 'package:flutter/material.dart';
import 'main.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {

    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0.0,
          title: Text(
            "jjapago",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          children: <Widget>[
            GestureDetector(
              onTap: (){
                Routes.goTranslate(context);
              },
              child: Container(
                height: deviceHeight / 2,
                alignment: Alignment.center,
                color: Colors.white,
                child: Text(
                  "번역할 내용을 입력하세요",
                  style: TextStyle(color: Colors.grey, fontSize: 30),
                )
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Container(
                      width: deviceWidth,
                      color: Colors.green,
                      child: Icon(Icons.mic, color: Colors.white.withOpacity(0.5),),
                    ),
                    flex: 1,
                    fit: FlexFit.tight,
                  ),
                  Flexible(
                    child: Container(
                      width: deviceWidth,
                      color: Colors.lightBlue,
                      child: Icon(Icons.chat, color: Colors.white.withOpacity(0.5),),
                    ),
                    flex: 1,
                    fit: FlexFit.tight,
                  ),
                  Flexible(
                    child: Container(
                      width: deviceWidth,
                      color: Colors.blue,
                      child: Icon(Icons.camera_alt, color: Colors.white.withOpacity(0.5),),
                    ),
                    flex: 1,
                    fit: FlexFit.tight,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
