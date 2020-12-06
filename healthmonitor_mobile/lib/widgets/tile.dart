import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthmonitor_mobile/utils/ui_helpers.dart';

class Tile extends StatelessWidget {
  const Tile({
    this.child,
    this.color,
    this.splashColor,
    this.onTap,
  });
  final Widget child;
  final Color color;
  final Color splashColor;
  final Function() onTap;

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: Material(
        color: color,
        elevation: 10.0,
        borderRadius: BorderRadius.circular(15.0),
        shadowColor: shadowColor(context),
        child: InkWell(
          child: child,
          splashColor: splashColor,
          borderRadius: BorderRadius.circular(15.0),
          onTap: onTap == null ? null : () => onTap(),
        ),
      ),
    );
  }
}
