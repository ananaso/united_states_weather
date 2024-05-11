import 'package:flutter/material.dart';

// Most widgets seem to require directionality to render
Directionality withDirectionality(Widget widget) {
  return Directionality(
    textDirection: TextDirection.ltr,
    child: widget,
  );
}
