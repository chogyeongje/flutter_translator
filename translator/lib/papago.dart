import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:translator/PapagoException.dart';

class Papago{

  static const String _client_ID = "qBk12Baqr3N8qLONx802";
  static const String _client_secret = "kvxIUEFXGx";

  // papago 번역 api url
  static const String _translateApiURL = "https://openapi.naver.com/v1/papago/n2mt";
  static const String _detectLanguageApiURL = "https://openapi.naver.com/v1/papago/detectLangs";

  static const Map<String, String> supportLanguages = {
    "한국어": "ko",
    "영어": "en",
    "중국어 같체": "zh-CN",
    "중국어 번체": "zh-TW",
    "스페인어": "es",
    "프랑스어": "fr",
    "베트남어": "vi",
    "태국어": "th",
    "인도네시아어": "id"
  };

  bool checkSupportTranslateLanguage(String sourceCode, String targetCode) {
    return true;
  }

  static Future<String> detectLang(String text) async {
    http.Response responseDetectLang = await http.post(
        _detectLanguageApiURL,
        headers: {
          "X-Naver-Client-Id" : _client_ID,
          "X-Naver-Client-Secret" : _client_secret,
        },
        body: {
          "query" : text
        }
    );

    if(responseDetectLang.statusCode != 200){
      throw HttpResponseException(responseDetectLang.statusCode);
    }

    Map<String, dynamic> resultDetectLang = json.decode(responseDetectLang.body);

    return resultDetectLang['langCode'];
  }

  static Future<String> translateText(String text, String sourceCode, String targetCode) async {

    if(text.isEmpty){
      return "";
    }

    String langCode;

    if(sourceCode == null || sourceCode.isEmpty){
      langCode = await detectLang(text);
    } else {
      langCode = sourceCode;
    }

    if(langCode == "unk") {
      throw UnknownLanguageException();
    }

    http.Response response = await http.post(
      _translateApiURL,
      headers: {
        "X-Naver-Client-Id" : _client_ID,
        "X-Naver-Client-Secret" : _client_secret,
      },
      body: {
        "source" : langCode,
        "target" : targetCode,
        "text": text,
      }
    );

    if(response == null){
      print('response is null');
    }

    if(response.statusCode != 200){
      throw HttpResponseException(response.statusCode);
    }

    Map<String, dynamic> result = json.decode(response.body);
    return result['message']['result']['translatedText'];
  }
}
