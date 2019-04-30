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
  void doVote(user, match, team) {
    setState(() {
      user.vote(match, team);
    });
  }

  _VoteWidgetState();
  @override
  Widget build(BuildContext context) {
    Vote uservote = widget.user.getUserVote(widget.match);
    Team votedTeam;
    bool hasvoted = false;
    print(uservote.team);
    if (uservote.team != null) {
      votedTeam = uservote.team;
      hasvoted = true;
    } else {
      hasvoted = false;
    }
    return Column(children: [
      Container(color: Colors.white, height: 15),
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
      Column(children: [
        AnimatedContainer(
            duration: Duration(milliseconds: 500),
            width: hasvoted ? 600 : 0,
            height: hasvoted ? 63 : 0,
            decoration: BoxDecoration(
              color: hasvoted ? Colors.teal : Colors.transparent,
            ),
            // border: Border(
            //     top: BorderSide(color: Colors.grey, width: 1),
            //     left: hasvoted ? BorderSide(color: Colors.teal, width: 600):BorderSide(color: Colors.teal, width: 1) )),
            child: Center(
                child: hasvoted
                    ? Text(
                        'Vote : ${uservote.team.name}',
                        style: ThemeBis.TextStyles.appBarTitleOnDark,
                      )
                    : Container())),
        hasvoted
            ? Container()
            : Flex(
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
                          onPressed: () => {
                                doVote(widget.user, widget.match,
                                    widget.match.teamHome)
                              },
                          color: ThemeBis.Colors.ctgColorBlue,
                        ))),
                    widget.match.drawPossible
                        ? Expanded(
                            flex: 6,
                            child: Container(
                                child: MaterialButton(
                              child: Text(
                                'DRAW',
                                style: ThemeBis.TextStyles.bigTextOnDark,
                              ),
                              onPressed: () => {
                                    doVote(widget.user, widget.match,
                                        widget.match.draw)
                                  },
                              color: ThemeBis.Colors.ctgColorGrey,
                            )))
                        : Spacer(flex: 0),
                    Expanded(
                        flex: 6,
                        child: Container(
                            child: MaterialButton(
                          child: Text(
                            'VOTE !',
                            style: ThemeBis.TextStyles.bigTextOnDark,
                          ),
                          onPressed: () => {
                                doVote(widget.user, widget.match,
                                    widget.match.teamAway)
                              },
                          color: ThemeBis.Colors.ctgColor,
                        ))),
                  ])
      ])
    ]);
  }
}
