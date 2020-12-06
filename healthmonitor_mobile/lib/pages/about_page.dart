import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthmonitor_mobile/utils/colors.dart';
import 'package:healthmonitor_mobile/utils/text_styles.dart';
import 'package:healthmonitor_mobile/utils/ui_helpers.dart';
import 'package:healthmonitor_mobile/widgets/tile.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  List<String> itemContent = [
    'What is this app about?',
    'Health Monitor is an AI powered platform designed to help users do preliminary analysis for vitals right at the comfort of their homes. \n\nUsing this app, users need not leave their home for minor health checkups.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: invertColorsStrong(context),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                left: 10.0,
                top: 50.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: Icon(EvaIcons.arrowIosBack),
                    tooltip: 'Go back',
                    color: colorsStrong(context),
                    iconSize: 26.0,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Material(
                    color: Colors.transparent,
                    child: Text(
                      'About',
                      style: TitleStylesDefault.black,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Hero(
                    tag: 'tile2',
                    child: Tile(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 70.0,
                              height: 70.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage('assets/icons/welcome.jpg'),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  EvaIcons.code,
                                  color: colorsMild(context),
                                  size: 18.0,
                                ),
                                SizedBox(
                                  width: 6.0,
                                ),
                                Text(
                                  'with',
                                  style: BodyStylesDefault.black,
                                ),
                                SizedBox(
                                  width: 6.0,
                                ),
                                Icon(
                                  EvaIcons.heart,
                                  color: MyColors.heart,
                                  size: 18.0,
                                ),
                                SizedBox(
                                  width: 6.0,
                                ),
                                Text(
                                  'by',
                                  style: BodyStylesDefault.black,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Team 2: Sneaky Sketchers',
                              style: LabelStyles.black,
                              softWrap: true,
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                      splashColor: MyColors.accent,
                    ),
                  ),
                  Tile(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            itemContent[0],
                            style: HeadingStylesDefault.accent,
                            textAlign: TextAlign.center,
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            itemContent[1],
                            style: BodyStylesDefault.black,
                            textAlign: TextAlign.left,
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          ),
                        ],
                      ),
                    ),
                    splashColor: MyColors.accent,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        heroTag: 'fab',
        child: Icon(
          EvaIcons.github,
          size: 36.0,
        ),
        tooltip: 'View GitHub repo',
        foregroundColor: invertColorsStrong(context),
        backgroundColor: colorsStrong(context),
        elevation: 5.0,
        onPressed: () => launchURL('https://github.com/yashk2000/team2'),
      ),
    );
  }
}
