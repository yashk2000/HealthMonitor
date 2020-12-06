import 'dart:ui';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:healthmonitor_mobile/utils/colors.dart';
import 'package:healthmonitor_mobile/utils/text_styles.dart';
import 'package:healthmonitor_mobile/utils/ui_helpers.dart';
import 'package:healthmonitor_mobile/widgets/bottom_sheet.dart';

import 'about_page.dart';
import 'liquid_page.dart';

class AppLandingPage extends StatefulWidget {
  @override
  _AppLandingPageState createState() => _AppLandingPageState();
}

class _AppLandingPageState extends State<AppLandingPage> {
  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: colorsMaterial(context),
      body: WillPopScope(
        onWillPop: this.handleBackPressed,
        child: Container(
          child: Stack(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10.0,
                      top: 50.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Hero(
                          tag: 'title0',
                          child: Material(
                            color: Colors.transparent,
                            child: Text(
                              '     Health Monitor',
                              style: TitleStylesDefault.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: <Widget>[
                      Hero(
                        tag: 'tile0',
                        child: Container(
                          height: _height / 1.8,
                          width: _width / 1.2,
                          margin: EdgeInsets.all(20.0),
                          child: Material(
                            color: invertColorsMild(context),
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(10.0),
                            shadowColor: shadowColor(context),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10.0),
                              splashColor: invertColorsMaterial(context),
                              child: null,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) {
                                      return LiquidPage();
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 440.0,
                        left: 40.0,
                        child: Material(
                          color: Colors.transparent,
                          child: Text(
                            'Welcome!',
                            style: HeadingStylesMaterial.dark,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 350.0,
                        left: 40.0,
                        child: Material(
                          color: Colors.transparent,
                          child: Text(
                            'Track your vitals',
                            style: HeadingStylesMaterial.dark,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 310.0,
                        left: 40.0,
                        child: Material(
                          color: Colors.transparent,
                          child: Text(
                            'using a mobile app.',
                            style: HeadingStylesMaterial.dark,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 100.0,
                        left: 40.0,
                        child: Text(
                          'Want some instructions?',
                          style: SubHeadingStylesMaterial.dark,
                        ),
                      ),
                      Positioned(
                        bottom: 60.0,
                        left: 40.0,
                        child: Hero(
                          tag: 'elt1',
                          child: Material(
                            color: Colors.transparent,
                            child: Text(
                              'Click here.',
                              style: HeadingStylesMaterial.dark,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 40.0,
                        right: 40.0,
                        child: Container(
                          height: 40.0,
                          width: 40.0,
                          child: FloatingActionButton(
                            heroTag: 'elt2',
                            foregroundColor: MyColors.light,
                            backgroundColor: MyColors.accent,
                            elevation: 3.0,
                            child: Icon(EvaIcons.info),
                            onPressed: () {
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  transitionsBuilder: (
                                    BuildContext context,
                                    Animation<double> animation,
                                    Animation<double> secondaryAnimation,
                                    Widget child,
                                  ) {
                                    return SlideTransition(
                                      position: Tween<Offset>(
                                        begin: Offset(0.0, 1.0),
                                        end: Offset.zero,
                                      ).animate(animation),
                                      child: SlideTransition(
                                        position: Tween<Offset>(
                                          begin: Offset.zero,
                                          end: Offset(0.0, 1.0),
                                        ).animate(secondaryAnimation),
                                        child: child,
                                      ),
                                    );
                                  },
                                  transitionDuration:
                                      Duration(milliseconds: 500),
                                  pageBuilder: (BuildContext context,
                                          Animation<double> animation,
                                          Animation<double>
                                              secondaryAnimation) =>
                                      Stack(
                                    children: <Widget>[
                                      Hero(
                                        tag: 'tile0',
                                        child: Container(
                                          child: Material(
                                            color:
                                                invertColorsMild(context),
                                            elevation: 5.0,
                                            shadowColor: shadowColor(context),
                                            child: InkWell(
                                              splashColor:
                                                  colorsMaterial(context),
                                              child: null,
                                              onTap: null,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: AboutPage(),
                                      ),
                                      Positioned(
                                        bottom: 15.0,
                                        right: 15.0,
                                        child: FloatingActionButton(
                                          heroTag: 'elt2',
                                          foregroundColor: MyColors.light,
                                          backgroundColor: MyColors.accent,
                                          elevation: 5.0,
                                          child: Icon(EvaIcons.close),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              BottomBar(),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> handleBackPressed() {
    if (isBottomSheetOpen) {
      toggleBottomSheet();
      return Future.value(false);
    }
    return Future.value(true);
  }
}
