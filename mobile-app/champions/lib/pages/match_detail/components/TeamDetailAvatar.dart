import 'package:flutter/material.dart';
import 'package:champions/models/index.dart';
import 'package:champions/ThemeBis.dart';

class TeamDetailAvatar extends StatelessWidget {
  final Encounter match;
  final Team team;
  final Vote vote;
  final int score;
  TeamDetailAvatar(this.match, this.team, this.score, this.vote);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            child: Text(team.name, style: TextStyles.teamNameDetails),
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0)),
        Hero(
            tag: 'match-icon-${match.id}-${team.name}',
            child: Image(
              image: AssetImage(team.flagImage),
              height: Dimens.matchFlagDetailHeight,
              width: Dimens.matchFlagDetailWidth,
            ))
      ],
    );
  }
}
