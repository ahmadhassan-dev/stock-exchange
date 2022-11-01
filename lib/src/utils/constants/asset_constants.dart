// ignore_for_file: non_constant_identifier_names

class AssetConstants {
  AssetConstants._private();

  static final AssetConstants _assetConstants = AssetConstants._private();

  factory AssetConstants() {
    return _assetConstants;
  }

  String MY_PIC = "assets/images/my_pic.jpeg";
}
