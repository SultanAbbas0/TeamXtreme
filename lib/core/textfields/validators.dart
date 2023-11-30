bool validatePassword(String value) {
  if ((value.length < 6) || value.isEmpty) {
    return false;
  }
  return true;
}

bool validateEmail(String value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = new RegExp(pattern);

  return regExp.hasMatch(value);
}

bool isNum(String string) {
  return num.tryParse(string) != null;
}
