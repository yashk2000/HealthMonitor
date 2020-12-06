import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'colors.dart';

Color colorsMild(BuildContext context) {
  return MyColors.dark;
}

Color invertColorsMild(BuildContext context) {
  return MyColors.light;
}

Color colorsStrong(BuildContext context) {
  return MyColors.black;
}

Color invertColorsStrong(BuildContext context) {
  return MyColors.white;
}

Color colorsMaterial(BuildContext context) {
  return MaterialColors.bg;
}

Color invertColorsMaterial(BuildContext context) {
  return MaterialColors.pink2;
}

Color shadowColor(BuildContext context) {
  return ShadowColors.light;
}

launchURL(String url) async {
  if (await canLaunch(url)) {
    print('Launching $url...');
    await launch(url);
  } else {
    print('Error launching $url!');
  }
}
