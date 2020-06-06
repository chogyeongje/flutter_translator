import 'package:flutter/material.dart';
import 'package:translator/langData.dart';
import 'package:translator/papago.dart';

import 'main.dart';

class TranslatePage extends StatefulWidget {
  @override
  _TranslatePageState createState() => _TranslatePageState();
}

class _TranslatePageState extends State<TranslatePage> {

  final TextEditingController _textEditingController = new TextEditingController();

  Future<String> futureTranslatedText;
  String translatedText = "";

  String sourceCode;
  String targetCode;

  bool isFirst = true;

  @override
  void initState() {
    _textEditingController.addListener(() {
      setState(() {
        futureTranslatedText = Papago.translateText(_textEditingController.text, sourceCode, targetCode);
      });
    });
    super.initState();

    print("init");
  }

  @override
  Widget build(BuildContext context) {

    sourceCode = LangData.sourceCode;
    targetCode = LangData.targetCode;

    double editHeight = MediaQuery.of(context).size.height * 0.1;

    return FutureBuilder<String>(
        future: futureTranslatedText,
        builder: (localContext, snapshot) {
          if(snapshot.hasData){
            translatedText = snapshot.data;
          } else if (snapshot.hasError) {
            translatedText = snapshot.error.toString();
          }
          return WillPopScope(
            onWillPop: () {
              return Routes.goHome(context);
            },
            child: SafeArea(
              top: true,
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  elevation: 0.0,
                  centerTitle: true,
                  title: Container(
                    height: editHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Flexible(flex: 1, fit: FlexFit.tight, child: languageButton(context, true, sourceCode)),
                        switchButton(),
                        Flexible(flex: 1, fit: FlexFit.tight, child: languageButton(context, false, targetCode)),
                      ],
                    ),
                  ),
                  automaticallyImplyLeading: false,
                ),
                body: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: editHeight,
                        child: TextField(
                          maxLines: null,
                          controller: _textEditingController,
                          decoration: InputDecoration(
                            hintText: "번역할 내용을 입력하세요"
                          ),
                        ),
                      ),
                      Text(
                        translatedText ?? "null",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                )
              ),
            ),
          );
        }
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  Widget languageButton(BuildContext context, bool isSource, String currentLang){
    return GestureDetector(
      onTap: (){
        Routes.goSelectLang(context, isSource, currentLang);
      },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(currentLang.isEmpty ? "자동 번역" : currentLang),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }

  Widget switchButton(){
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.white,
      elevation: 5,
      child: Icon(Icons.compare_arrows),
      onPressed: (){
        setState(() {
          LangData.switchCode();
        });
      },
    );
  }
}
