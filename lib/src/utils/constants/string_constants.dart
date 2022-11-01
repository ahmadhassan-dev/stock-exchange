// ignore_for_file: non_constant_identifier_names

class StringConstants {
  StringConstants._private();

  static final StringConstants _stringConstants = StringConstants._private();

  factory StringConstants() {
    return _stringConstants;
  }

  String NO_INTERNET = "Kindly check your internet connection";
  String SEARCH = "Search...";
  String K_SEARCH_ICON_KEY = "search_icon_key";
}
