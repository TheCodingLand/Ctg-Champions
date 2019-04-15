import 'package:flutter/material.dart';

import 'package:champions/models/index.dart';

import 'package:champions/inheritedUserWidget.dart';
import 'components/TeamDetailAvatar.dart';
import 'components/VoteWidget.dart';
import 'components/MatchHeaderDetail.dart';
import 'components/MatchLiveView.dart';
class EncounterDetailBody extends StatelessWidget {
  final Encounter match;
  final User user;
  
  EncounterDetailBody(this.match, this.user);

  @override
  Widget build(BuildContext context) {
    Vote vote = user.getUserVote(match);
    bool started = match.isStarted();
    //bool result = user.getUserResult();
    

    return Container(
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  child: Center(
                      child: Column(children: <Widget>[
               
                Row(children: [
                  Expanded(child:MatchHeaderDetail(match)),
                 
                ]),
                Row(children: <Widget>[
                Expanded(child: Container(color: Colors.black, height: 1)),],),
                Stack(children: <Widget>[
                  Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                          child: TeamDetailAvatar(
                              match, match.teamHome, match.scoreHome, vote),
                          flex: 6),
                      Expanded(
                          child: TeamDetailAvatar(
                              match, match.teamAway, match.scoreAway, vote),
                          flex: 6)
                    ],
                  ),
                  Flex(direction: Axis.horizontal, children: <Widget>[
                    Expanded(
                        child: Center(
                            child: Container(
                                padding: EdgeInsets.only(top: 150),
                                child: Center(
                                    child: Text('VS',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 50))))))
                  ]),
                ]),
                match.isStarted() ? 
                MatchLiveView(match)
                :
                VoteWidget(match, user, vote)
              ])));
            }));
  }
}
