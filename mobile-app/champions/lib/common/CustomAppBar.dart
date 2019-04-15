import 'package:flutter/material.dart';
import 'package:champions/ThemeBis.dart' as Theme;
//import 'package:champions/models/matches.dart';
import 'package:champions/inheritedMatchList.dart';

class CustomAppBar extends StatelessWidget {
  
  final String title;
  final double barHeight = 66.0;

  CustomAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    final MyInheritedMatchListWidgetState matches = MyInheritedMatchListWidget.of(context);
    final double statusbarHeight = MediaQuery
      .of(context)
      .padding
      .top;

    return Container(
      padding: EdgeInsets.only(top: statusbarHeight),
      height: statusbarHeight + barHeight,
      child: Stack( fit : StackFit.expand ,
       children: 
      [
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
      
      children: [
       Text(
          title,
          style: Theme.TextStyles.appBarTitle,
        ),Text(" ")]),
        
    
      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      ButtonBar(alignment: MainAxisAlignment.end, children: <Widget>[
        InkWell(onTap: () { matches.addEncounter(); },
          child: Icon(Icons.plus_one)),
        

        InkWell(onTap: () {  },
          child: Icon(Icons.account_circle)),
        
        
        Icon(Icons.settings)],
        )
      ])]),
     /*  decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Theme.Colors.appBarGradientStart, Theme.Colors.appBarGradientEnd],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.5, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp
        ),
      ), */
    );
  }
}