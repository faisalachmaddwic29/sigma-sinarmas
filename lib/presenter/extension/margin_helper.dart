import 'package:flutter/material.dart';

extension Margin on Widget {
  Widget marginBottom(double margin) {
    return Container(
      margin: EdgeInsets.only(bottom: margin),
      child: this,
    );
  }

  Widget marginTop(double margin) {
    return Container(
      margin: EdgeInsets.only(top: margin),
      child: this,
    );
  }

  Widget marginRight(double margin) {
    return Container(
      margin: EdgeInsets.only(right: margin),
      child: this,
    );
  }

  Widget marginLeft(double margin) {
    return Container(
      margin: EdgeInsets.only(left: margin),
      child: this,
    );
  }

  Widget marginSymetric({double vertical = 0, double horizontal = 0}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: this,
    );
  }

  Widget marginOnly(
      {double top = 0, double bottom = 0, double right = 0, double left = 0}) {
    return Container(
      margin:
          EdgeInsets.only(bottom: bottom, top: top, right: right, left: left),
      child: this,
    );
  }
}
