import 'package:flutter/material.dart';
import 'package:champions/models/index.dart';
import 'package:fluro/fluro.dart';
import 'components/TeamWidget.dart';
import 'components/MatchHeader.dart';
import 'package:champions/Routes.dart';
import 'components/Result.dart';
//DateTime now = DateTime.now();
//String formattedDate = DateFormat('kk:mm').format(now);

class EncounterRow extends StatelessWidget {
  final Encounter match;
  final User user;

  EncounterRow(this.match, this.user);
  @override
  Widget build(BuildContext context) {
    _navigateTo(context, String id) {
    Routes.navigateTo(context, '/detail/${match.id}',
        transition: TransitionType.fadeIn);
    }
    bool voted = false;
    String votedTeamName="";
    bool homeSelected = false;
    bool awaySelected = false;
    bool drawSelected = false;
    bool homeWin=false;
    bool awayWin=false;
    Team winner;
    if (match.scoreHome> match.scoreAway) {
      winner = match.teamHome;
      homeWin=true;
    }
    else  
    {
      if (match.scoreHome< match.scoreAway) {

      
      winner = match.teamAway;
      awayWin=true;
      }
      else { winner = match.draw; }

    }
    
    bool userDidWin=false;
    Vote vote = user.getUserVote(match);
    if (vote.team!=null) { 
      votedTeamName=vote.team.name;
      voted=true;
      if (match.teamHome== vote.team)
      { 
        homeSelected= true;
        if (match.teamHome==winner) {
          userDidWin=true;
        }
      }
    if (match.teamAway== vote.team) 
      {
       awaySelected=true;
      if (match.teamAway==winner) {
          userDidWin=true;
        }
      }
    if (match.draw== vote.team) { 
        drawSelected=true;
        if (match.draw==winner) {
          userDidWin=true;
        }
    }
    }
    //print(vote.toString());
    
    
    DateTime today = DateTime.now();
    bool passed;
    if (today.isAfter(match.date)) {
      passed = true;
    } else {
      passed = false;
    }
    Widget item = Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InkWell(
            onTap: () => _navigateTo(context, match.id),
            child:
          Container(
              height: 170,
              decoration: BoxDecoration(
                  color: passed ? Colors.grey.shade200 : Colors.white,
                  border: Border(
                      top: BorderSide(color: Colors.grey, width: 1),
                      left: BorderSide(color: Colors.teal, width: 10))),
              child: Column(children: [
                MatchHeader(match),
                TeamWidget(match, match.teamHome, match.scoreHome, userDidWin, homeSelected, homeWin, drawSelected),
                TeamWidget(match, match.teamAway, match.scoreAway, userDidWin, awaySelected, awayWin, drawSelected),
                Container(height: 12,),
                Result(match.isLive(), match.isStarted(),voted,userDidWin, votedTeamName),
                Container(height: 12),
              ]))),
        ]);
    return item;
  }
}

