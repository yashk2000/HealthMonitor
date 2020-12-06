import 'package:flutter/material.dart';
import 'package:healthmonitor_mobile/utils/colors.dart';
import 'package:healthmonitor_mobile/utils/text_styles.dart';
import 'package:healthmonitor_mobile/widgets/tile.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class LiquidPage extends StatefulWidget {
  @override
  _LiquidPageState createState() => _LiquidPageState();
}

class _LiquidPageState extends State<LiquidPage> {
  List<String> itemContent = [
    'Heart & Respiratory Rate Measurement',
    'Please sit in an upright position and face the camera.\n\nMake sure the face is well lit.\n\nStay as still as you can.\n\nHit on the Measure button and wait for the camera to capture your image.\n\nAfter capturing the image please wait for about 15-20 seconds before pressing on the Next button. \n\nThis is to make sure that your video frames are written to our data base for analyzing your heart and respiration rate.',
    'SpO2 Measurement',
    'Please sit in an upright position and place your index finger facing the camera. \n\nMake sure there is about 3-5 cms distance between your finger and the camera. \n\nHit on the Measure button and wait for the camera to capture your finger\'s image. After capturing the image please wait for about 5-10 seconds before pressing on the Next button. \n\nThis is to make sure that your video frames are written to our data base for analyzing your SpO2 levels. \n\nPlease wait for about 10-15 seconds on the Test Results Page if there is any delay as data would require few seconds to be analyzed and retrieved back.',
    'Results',
    'Now you can proceed to the final step of getting the results. \n\nYou will be shown your: \n1. Heart Rate in BPM\n2. Respiratory Rate in CPM\n3. SpO2 Level in %\n\nYou can also get the results sent to yourself over email to save them for later use.'
  ];

  @override
  Widget build(BuildContext context) {
    final pages = [
      Container(
        color: MyColors.bg,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  Tile(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "INSTRUCTIONS: Step 1",
                            style: HeadingStylesDefault.accent,
                            textAlign: TextAlign.center,
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          ),
                        ],
                      ),
                    ),
                    splashColor: MyColors.accent,
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
      Container(
        color: MyColors.teal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  Tile(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "INSTRUCTIONS: Step 2",
                            style: HeadingStylesDefault.accent,
                            textAlign: TextAlign.center,
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          ),
                        ],
                      ),
                    ),
                    splashColor: MyColors.accent,
                  ),
                  Tile(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            itemContent[2],
                            style: HeadingStylesDefault.accent,
                            textAlign: TextAlign.center,
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            itemContent[3],
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
      Container(
        color: MyColors.lightEnd,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  Tile(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "INSTRUCTIONS: Results",
                            style: HeadingStylesDefault.accent,
                            textAlign: TextAlign.center,
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          ),
                        ],
                      ),
                    ),
                    splashColor: MyColors.accent,
                  ),
                  Tile(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            itemContent[4],
                            style: HeadingStylesDefault.accent,
                            textAlign: TextAlign.center,
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            itemContent[5],
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
    ];

    return LiquidSwipe(
      pages: pages,
      initialPage: 0,
      fullTransitionValue: 350.0,
      enableLoop: true,
      waveType: WaveType.liquidReveal,
    );
  }
}
