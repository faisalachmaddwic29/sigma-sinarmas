import 'package:flutter/material.dart';

import 'color.dart';

class SinarmasFonts {
  // POPPINS
  TextStyle bold({
    double? size,
    Color? color,
    double? height,
    double? letterSpacing,
    bool italic = false,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return TextStyle(
      fontFamily: 'PBold',
      fontSize: size ?? 30,
      fontWeight: fontWeight,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
      color: color ?? SinarmasColors.black,
      letterSpacing: letterSpacing,
    );
  }

  TextStyle semiBold({
    double? size,
    Color? color,
    double? height,
    double? letterSpacing,
    bool italic = false,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return TextStyle(
      fontFamily: 'PSemiBold',
      fontSize: size ?? 22,
      fontWeight: fontWeight,
      height: height,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
      color: color ?? SinarmasColors.black,
      letterSpacing: letterSpacing,
    );
  }

  TextStyle medium({
    double? size,
    Color? color,
    double? height,
    double? letterSpacing,
    bool italic = false,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return TextStyle(
      fontFamily: 'PMedium',
      fontSize: size ?? 15,
      fontWeight: fontWeight,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
      color: color ?? SinarmasColors.black,
      letterSpacing: letterSpacing,
    );
  }

  TextStyle regular({
    double? size,
    Color? color,
    double? height,
    double? letterSpacing,
    bool italic = false,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return TextStyle(
      fontFamily: 'PRegular',
      fontSize: size ?? 14,
      fontWeight: fontWeight,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
      color: color ?? SinarmasColors.black,
      letterSpacing: letterSpacing,
    );
  }

  TextStyle light({
    double? size = 12,
    Color? color,
    double? height,
    double? letterSpacing,
    bool italic = false,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return TextStyle(
      fontFamily: 'PLight',
      fontSize: size ?? 12,
      fontWeight: fontWeight,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
      color: color ?? SinarmasColors.black,
      letterSpacing: letterSpacing,
    );
  }

  // END POPPINS

  TextStyle textStyle({
    double? size,
    Color? color,
    double? height,
    double? letterSpacing,
    bool italic = false,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return TextStyle(
      height: height,
      fontSize: size ?? 14,
      fontWeight: fontWeight,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
      color: color ?? SinarmasColors.black,
      letterSpacing: letterSpacing,
    );
  }
}
