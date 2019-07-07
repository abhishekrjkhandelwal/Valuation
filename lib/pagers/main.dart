import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'pager.dart';
import 'shade.dart';
import 'package:imovaluer/ValuationList/list.dart';
import 'package:imovaluer/calendar/calendar_main.dart';
import 'package:imovaluer/homepage.dart';


class EntryPoint extends StatefulWidget {
  _EntryPointState createState() => new _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  final PageController pagerController =
      new PageController(keepPage: true, initialPage: 1);

  double offsetRatio = 0.0;
  double offsetFromOne = 0.0;

  bool onPageView(ScrollNotification notification) {
    if (notification.depth == 0 && notification is ScrollUpdateNotification) {
      setState(() {
        offsetFromOne = 1.0 - pagerController.page;
        offsetRatio = offsetFromOne.abs();
      });
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return new MediaQuery(
      data: new MediaQueryData.fromWindow(window),
      child: new Directionality(
        textDirection: TextDirection.ltr,
        child: new Scaffold(
          body: new Stack(
            children: <Widget>[

              new HomePage(),

              new Shade(
                opacity: offsetRatio,
                isLeft: offsetFromOne > 0,
              ),

              new NotificationListener<ScrollNotification>(
                onNotification: onPageView,
                child: new Pager(
                  controller: pagerController,
                  leftWidget: new ValutationList(),
                  rightWidget: new CalendarViewApp(),
                )
              ),
            ],
          ),
        )
      )
    );
  }
}



void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_) {
      runApp(new EntryPoint());
    });
}
