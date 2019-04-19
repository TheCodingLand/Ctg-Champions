import 'package:flutter/material.dart';


class Result extends StatelessWidget {
  final bool isLive;
  final bool ended;
  final bool voted;
  final bool userDidWin;
  final String teamname;
  Result(this.isLive,this.ended,this.voted,this.userDidWin, this.teamname);
  
  @override
  Widget build(BuildContext context) {
    //print(voted);
    Expanded exp = Expanded(flex: 4, child: Container(color: Colors.black, child : Text("Vote!",textAlign: TextAlign.center, style: TextStyle(color:Colors.white, fontSize: 18) )));
    if (voted) {
      exp = Expanded(flex: 4, child: Container(color: Colors.white, child : Text("$teamname", textAlign: TextAlign.center,style: TextStyle(color:Colors.black, fontSize: 18) )));
    }

    
    if (ended) {
      if (userDidWin) exp = Expanded(flex: 4, child: Container(color: Colors.green, child : Text(" Won",textAlign: TextAlign.center,  style: TextStyle(color:Colors.white, fontSize: 18) )));
      else exp = Expanded(flex: 4, child: Container(color: Colors.red[800], child : Text("Lost", textAlign: TextAlign.center, style: TextStyle(color:Colors.white, fontSize: 18) )));
    }
    if (isLive) {
      exp = Expanded(flex: 4, child: Container(color: Colors.teal, child : Center(child:Text("Live !",textAlign: TextAlign.center,  style: TextStyle(color:Colors.white, fontSize: 18) ))));
    }

    
    return Flex(
                  
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Spacer(flex:4),
                   exp,
                   Spacer(flex:4),
                  ],
                );
  }
}