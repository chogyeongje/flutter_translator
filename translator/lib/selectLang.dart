import 'package:flutter/material.dart';
import 'package:translator/papago.dart';

import 'langData.dart';
import 'main.dart';

class SelectLang extends StatefulWidget {
  @override
  _SelectLangState createState() => _SelectLangState();
}

class _SelectLangState extends State<SelectLang> {
  TextStyle selectedTextStyle =
      TextStyle(color: Colors.green, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    List<dynamic> data = ModalRoute.of(context).settings.arguments;

    bool isSource = data[0];
    String title = isSource ? "이 언어로 입력" : "이 언어로 번역";

    String currentLang = data[1];

    Widget selectAutoTranslate = isSource
        ? ListTile(
            title: Text("자동 번역", style: currentLang.isEmpty ? selectedTextStyle : null),
            onTap: () {
              LangData.setSourceCode = "";
              Routes.goBack(context);
            },
            selected: currentLang.isEmpty,
          )
        : Container();

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: <Widget>[
            selectAutoTranslate,
            Expanded(
              child: ListView.builder(
                itemCount: Papago.supportLanguages.length,
                itemBuilder: (context, index) {
                  String key = Papago.supportLanguages.keys.elementAt(index);
                  bool isSelect = Papago.supportLanguages[key] == currentLang;
                  return languageTile(key, isSource, isSelect);
                },
              ),
            )
          ],
        ));
  }

  Widget languageTile(String key, bool isSource, bool isSelect) {
    return ListTile(
      title: Text(key, style: isSelect ? selectedTextStyle : null),
      onTap: () {
        if(isSource){
          LangData.setSourceCode = Papago.supportLanguages[key];
        } else {
          LangData.setTargetCode = Papago.supportLanguages[key];
        }
        Routes.goBack(context);
      },
      selected: isSelect,
    );
  }
}
