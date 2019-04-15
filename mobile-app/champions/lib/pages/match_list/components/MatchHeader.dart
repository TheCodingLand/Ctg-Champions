import 'package:flutter/material.dart';
import 'package:champions/models/index.dart';
import 'package:champions/common/DateDisplay.dart';
class MatchHeader extends StatelessWidget {
  final Encounter match;
  MatchHeader(this.match);
  
  @override
  Widget build(BuildContext context) {
    String formattedDate = dateDisplay(match.date);
    return Flex(
                  
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Spacer(flex: 2),
                    Expanded(flex: 6, child: Container(padding: EdgeInsets.all(8), child:Text(formattedDate, style: TextStyle(fontWeight: FontWeight.w700 ),))),
                    match.isLive()? Expanded(flex:1, child: Icon(  Icons.remove_from_queue, color:Colors.red,)): Spacer(flex:1),
                    Spacer(flex:2)
                  ],
                );
  }
}
