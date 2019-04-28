import 'package:flutter/material.dart';
import 'package:champions/models/index.dart';
import 'package:champions/ThemeBis.dart' as ThemeBis;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TeamWidget extends StatelessWidget {
  final Encounter match;
  final Team team;

  final int score;
  final bool userDidWin;
  final bool selected;
  final bool win;
  final bool drawSelected;
  TeamWidget(this.match, this.team, this.score, this.userDidWin, this.selected, this.win, this.drawSelected);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
            flex: 2,
            child: Hero(
                tag: 'match-icon-${match.id}-${team.name}',
                child: Image(
                  image: AssetImage(team.flagImage),
                  height: 35,
                  width: 35,
                ))),
        Expanded(
            flex: 6,
            child:
                Container(padding: EdgeInsets.all(6), child: win? Text(team.name,style:ThemeBis.TextStyles.matchTitle) :  Text(team.name,style:ThemeBis.TextStyles.matchTeamLoss))),
        selected
            ? Expanded(
                flex: 2,
                child: Container(
                    padding: EdgeInsets.fromLTRB(0,8,0,10),
                    child: match.isStarted() ? 
                    userDidWin
                        ? Text(
                            '+3 pts',
                            style: TextStyle(color: Colors.green),
                          )
                        : Text(
                            '+0 pts',
                            style: TextStyle(color: Colors.red),
                        )
                        : Container(height:16, child: Icon(FontAwesomeIcons.checkCircle, size:20, color: Colors.green)) ,
                          
                          ))
            : drawSelected ? Container(height:16, child: Icon(FontAwesomeIcons.equals, size:20, color: Colors.orange)) : Spacer(flex:2),
            Spacer(flex: 2),
        Expanded(
            flex: 1,
            child: Container(
                padding: EdgeInsets.all(8), child: Text(score.toString()))),
      ],
    );
  }
}
