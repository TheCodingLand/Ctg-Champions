
import 'package:flutter/material.dart';
import 'package:champions/ThemeBis.dart' as ThemeBis;
class  AppLogo extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return (
      Container(
        padding: const EdgeInsets.only(
        top: 50.0,
        bottom: 50.0,

      ),
      alignment: FractionalOffset.center,
      
      height: 250,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ 
      
      Image(
        image: ExactAssetImage('assets/logo/ctg.png'), height: 100, width: 100,
      ), Container(padding: const EdgeInsets.only(top:13), child: Text("CHAMPIONS", style: ThemeBis.TextStyles.appBarTitleOnDark)),
      
        ]
)));
}
}
