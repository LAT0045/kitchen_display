import 'package:flutter/material.dart';
import 'package:kitchen_display/screen_type/formFactory.dart';

enum ScreenType { desktop, handset, watch, tablet }

ScreenType getFormFactor(BuildContext context) {
  double deviceWidth = MediaQuery.of(context).size.shortestSide;

  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    return ScreenType.tablet;
  } else {
    if (deviceWidth > FormFactor.handset) return ScreenType.handset;
    return ScreenType.watch;
  }
}
