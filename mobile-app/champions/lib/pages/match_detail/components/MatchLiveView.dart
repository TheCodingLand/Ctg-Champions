import 'package:flutter/material.dart';
import 'package:champions/ThemeBis.dart' as ThemeBis;
import 'package:champions/models/index.dart';
INher

class MatchLiveView extends StatelessWidget {
  final Encounter match;
  MatchLiveView(this.match);

  @override
  Widget build(BuildContext context) {
    Event e = Event(gameminute:15,team:match.teamHome,text: 'Rooney Scored');
    
    ListView list = ListView.builder(
      itemBuilder: (context, position) {
        return Card(
          child: Text('${match.events[position].gameminute.toString()} : ${match.events[position].text} for ${match.events[position].team.name} ')
        );
      },
      itemCount: match.events.length,
    ); 
    return  Column(children: [
      Container(height: 15, color: Colors.white),
      Container(height: 50, color: Colors.white, child: 
      
      Flex(direction: Axis.horizontal,
      children: <Widget>[
          Spacer(flex: 1),
          Expanded( flex: 3, child: Text(match.scoreHome.toString(), textAlign: TextAlign.center, style: TextStyle(fontSize: 50))),
          Expanded( flex: 1, child: Text("-" ,textAlign: TextAlign.center, style: TextStyle(fontSize: 50))),
          Expanded( flex: 3, child: Text(match.scoreAway.toString(),textAlign: TextAlign.center, style: TextStyle(fontSize: 50))),
          Spacer(flex: 1)
      ],)),
      Container(height: 15, color: Colors.white),
      Container(height: 1, color: Colors.grey),
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
                    "Match Events :",
                    style: ThemeBis.TextStyles.bigTextOnDark,
                  ))))
        ],
      ),
      Container(height: 15, color: Colors.white),
      Container(height: 100, 
      child:list
      
      ),

      MaterialButton(onPressed:() => match.events.add(e), child: Text('TEST'),)
      
      ]);
  }
}
