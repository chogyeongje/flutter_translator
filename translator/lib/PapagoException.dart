class UnknownLanguageException implements Exception {
  String toString(){
    return "We can't detect language type";
  }
}

class NotSupportTargetException implements Exception {

  final String _sourceCode;
  final String _targetCode;

  NotSupportTargetException(this._sourceCode, this._targetCode);

  String toString(){
    return "We do not support translating $_sourceCode into $_targetCode";
  }
}

class HttpResponseException implements Exception {

  final int responseCode;

  HttpResponseException(this.responseCode);

  String toString(){
    return "Http Response Error with response code $responseCode, check log please";
  }
}



