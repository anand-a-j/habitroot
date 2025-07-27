import 'dart:ui' show Color;

class StringUtils {
  static String colorToDartConst(Color color) {
     final hex = color.value.toRadixString(16).padLeft(8, '0').toUpperCase();
    return '0x$hex';
  }

  static Color colorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase();

    return Color(int.parse(hexColor));
  }
}
