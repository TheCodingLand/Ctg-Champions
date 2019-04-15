import 'package:flutter/material.dart';
import 'package:champions/models/index.dart';
import 'package:champions/common/DateDisplay.dart';

class MatchHeaderDetail extends StatelessWidget {
  final Encounter match;
  MatchHeaderDetail(this.match);

  @override
  Widget build(BuildContext context) {
    bool live = match.isLive();

    String formattedDate = dateDisplay(match.date);
    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Spacer(flex: 3),
        Expanded(
            flex: 8,
            child: Container(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: Text(
                  formattedDate,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                ))),
        Expanded(
            flex: 2,
            child: live
                ? Text(
                    "Live !",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.red[700],
                        fontWeight: FontWeight.w700),
                  )
                : Text("")),
        live
            ? Expanded(
                flex: 1,
                child: Icon(
                  Icons.remove_from_queue,
                  color: Colors.red,
                ))
            : Spacer(flex: 1),
        Spacer(flex: 1)
      ],
    );
  }
}
