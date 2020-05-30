# flutter_translator
papago 이용 번역어플


https://developers.naver.com/apps/#/myapps/qBk12Baqr3N8qLONx802/overview
위 사이트로 들어가서

<pre>
<code>
curl "https://openapi.naver.com/v1/papago/n2mt" \
-H "Content-Type: application/x-www-form-urlencoded; charset=UTF-8" \
-H "X-Naver-Client-Id: qBk12Baqr3N8qLONx802" \
-H "X-Naver-Client-Secret: kvxIUEFXGx" \
-d "source=ko&target=en&text=만나서 반갑습니다." -v
</code>
</pre>

에서 앞부분에 
-H 인 경우는 http header 부분에,
-d 인 경우는 http body 부분에,
넣어주시면 됩니다.

응답 코드는
<pre>
<code>
{
    "message": {
        "@type": "response",
        "@service": "naverservice.labs.api",
        "@version": "1.0.0",
        "result": {
            "translatedText": "tea"
        }
    }
}
</code>
</pre>
형태입니다. 참고하여 작성 바랍니다.

https://developers.naver.com/docs/nmt/reference/
위 사이트에서 원본을 확인할 수 있습니다.

또한 Future 객체를 화면에 띄우기 위해서는 Futurebuilder 라는 것을 이용해야 합니다.
자세한 것은 코드나 아래 사이트를 참고 바랍니다.
https://flutter-ko.dev/docs/cookbook/networking/fetch-data
