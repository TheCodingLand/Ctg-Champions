import 'package:flutter/material.dart';
import 'package:champions/models/index.dart';

import 'package:champions/ThemeBis.dart' as ThemeBis;


//class VoteWidget extends StatefulWidget {
class VoteWidget extends StatefulWidget {
final Encounter match;
final User user;
final Vote vote;

VoteWidget(this.match, this.user, this.vote);
  @override
  _VoteWidgetState createState() => _VoteWidgetState();
}

class _VoteWidgetState extends State<VoteWidget> {
  

//}

//class VoteWidget extends StatelessWidget {
  
  
  
  _VoteWidgetState();
  @override
  Widget build(BuildContext context) {
    
    return Column(children: [
      Container(height: 15, color: Colors.white),
      Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
              flex: 12,
              child: Container(
                  color: Colors.black,
                  child: Center(
                      child: Text(
                    "Who will win ? !",
                    style: ThemeBis.TextStyles.bigTextOnDark,
                  ))))
        ],
      ),
      Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
                flex: 6,
                child: Container(
                  child: MaterialButton(
                  child: Text(
                    'VOTE !',
                    style: ThemeBis.TextStyles.bigTextOnDark,
                  ),
                  onPressed: () => {widget.user.vote(widget.match, widget.match.teamHome)},
                  color: ThemeBis.Colors.ctgColorBlue,
                ))),
            widget.match.drawPossible?Expanded(
                flex: 6,
                child: Container(
                  child: MaterialButton(
                  child: Text(
                    'DRAW',
                    style: ThemeBis.TextStyles.bigTextOnDark,
                  ),
                  onPressed: () => {widget.user.vote(widget.match, widget.match.draw)},
                  color: ThemeBis.Colors.ctgColorGrey,
                ))):Spacer(flex: 0),
            Expanded(
                flex: 6,
                child: Container(
                  child: MaterialButton(
                  child: Text(
                    'VOTE !',
                    style: ThemeBis.TextStyles.bigTextOnDark,
                  ),
                  onPressed: () => {widget.user.vote(widget.match, widget.match.teamAway)},
                  color: ThemeBis.Colors.ctgColor,
                ))),
          ])
    ]);

//                      Container(color: Colors.black, height: 50, width: 1),
  }
}
