import 'package:flutter/material.dart';
import 'package:translator/papago.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<String> text;
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<String>(
        // future 변수에 Future<> 형식으로 데이터를 받는 변수 설정
        future: text,
        builder: (context, snapshot){
          return Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // snapshot.data 를 통해서 번역된 String 받을 수 있음
                  Text(snapshot.data?? "null"),
                  TextField(
                    controller: myController,
                  ),
                  RaisedButton(
                    onPressed: (){
                      setState(() {
                        text = Papago.translateText(myController.text);
                      });
                    },
                  )
                ],
              ),
            )
          );
        },
      ),
    );
  }
}
