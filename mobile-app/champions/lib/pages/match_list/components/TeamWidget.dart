import 'package:flutter/material.dart';
import 'package:champions/models/index.dart';

class TeamWidget extends StatelessWidget {
  final Encounter match;
  final Team team;

  final int score;
  final bool userDidWin;
  final bool selected;
  TeamWidget(this.match, this.team, this.score, this.userDidWin, this.selected);

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
                Container(padding: EdgeInsets.all(8), child: Text(team.name))),
        selected
            ? Expanded(
                flex: 2,
                child: Container(
                    padding: EdgeInsets.all(8),
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
                        : Text("selected", style: TextStyle(color: Colors.purple) ,),
                          
                          ))
            : Spacer(flex: 2),
        Expanded(
            flex: 1,
            child: Container(
                padding: EdgeInsets.all(8), child: Text(score.toString()))),
      ],
    );
  }
}
