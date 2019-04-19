import 'package:flutter/material.dart';
import 'package:champions/models/index.dart';
import 'package:champions/models/matches.dart';
import 'package:champions/inheritedUserWidget.dart';
//import 'DetailAppBar.dart';
import 'EncounterDetails.dart';

class MatchDetailPage extends StatelessWidget {

  final Encounter match;
  

  MatchDetailPage(String id) : match = MatchesDao.getEncounterById(id);



  @override
  Widget build(BuildContext context) {
    final MyInheritedUserWidgetState userstate = MyInheritedUserWidget.of(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          EncounterDetailBody(match, userstate.user),

          //DetailAppBar(),
        ],
      ),
    );
  }
}