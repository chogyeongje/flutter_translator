class LangData{
  static String _sourceCode = "en";
  static String _targetCode = "ko";

  static get sourceCode => _sourceCode;
  static get targetCode => _targetCode;

  static set setSourceCode(String sourceCode){
    _sourceCode = sourceCode;
  }

  static set setTargetCode(String targetCode){
    _targetCode = targetCode;
  }

  static switchCode(){
    String temp = _sourceCode;
    _sourceCode = _targetCode;
    _targetCode = temp;
  }
}