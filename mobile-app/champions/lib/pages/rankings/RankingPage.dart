import 'package:flutter/material.dart';
import 'package:champions/ThemeBis.dart' as ThemeBis;
class RankingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(

      child: Container(
            padding: EdgeInsets.fromLTRB(10, 100, 10, 10),
            child:
            Column(
        children: <Widget>[
          Container(height:250, width: 250, child: Image.asset('assets/img.png')),
          // TODO Add large cup icon with top player name. 
          Text('1 - John: 15 pts', style: ThemeBis.TextStyles.appBarTitle),
          Text('2 - Doe : 13 pts', style:  ThemeBis.TextStyles.appBarTitle),
          Text('3 - test', style:  ThemeBis.TextStyles.appBarTitle),
          Text('4 - test', style:  ThemeBis.TextStyles.appBarTitle),
          Text('5 - test', style:  ThemeBis.TextStyles.appBarTitle),
        
        ],
      ),
      
    ));
  }
}