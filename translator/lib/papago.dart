import 'dart:convert';
import 'package:http/http.dart' as http;

class Papago{

  static const String _client_ID = "qBk12Baqr3N8qLONx802";
  static const String _client_secret = "kvxIUEFXGx";

  // papago 번역 api url
  static const String _apiURL = "https://openapi.naver.com/v1/papago/n2mt";

  static Future<String> translateText(String text) async {

    http.Response response = await http.post(
      _apiURL,
      headers: {
        "X-Naver-Client-Id" : _client_ID,
        "X-Naver-Client-Secret" : _client_secret,
      },
      body: {
        "source" : "ko",
        "target" : "en",
        "text": text,
      }
    );

    if(response.statusCode != 200){
      throw Exception;
    }
    Map<String, dynamic> result = json.decode(response.body);
    return result['message']['result']['translatedText'];

//    return result["translatedText"];
  }

}