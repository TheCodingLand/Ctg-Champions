import 'package:flutter/material.dart';

class Colors {

  const Colors();


  static const Color appBarTitle = const Color(0xff000000);
  static const Color appBarTitleGrey = const Color(0xffdddddd);
  static const Color appBarIconColor = const Color(0xFFFFFFFF);
  static const Color appBarDetailBackground = const Color(0x00FFFFFF);
  static const Color appBarGradientStart = const Color(0xFF000000);
  static const Color appBarGradientEnd = const Color(0xFF00000);
  static const Color ctgColor = const Color.fromRGBO(0, 155, 122, 1.0);
  static const Color ctgColorBlue = const Color.fromRGBO(155, 26, 0, 1.0);
  static const Color ctgColorGrey = const Color.fromRGBO(155, 155, 155, 1.0);
  static const RadialGradient voteDrawButton = const RadialGradient(
    radius: 2.15,
    center: const Alignment(0.7, -0.6),
      colors: [
      const Color(0xFFFEDBED), // yellow sun
      const Color(0xFFFDB9B9),
      const Color(0xFF9f7979),
      const Color(0xFF8A6EA6),
      const Color(0xFF5d4a4a),
      const Color(0xFF5d4a4a),
      const Color(0xFFFDB9B9),
      const Color(0xFFFEDBED)
    ],
    stops: [ 0,.1,.3,.4,.6,.8,1,1.2]
     
    );


  static const RadialGradient voteButton = const RadialGradient(
    radius: 2.15,
    center: const Alignment(0.7, -0.6),
      colors: [
      const Color(0xFFFEDB37), // yellow sun
      const Color(0xFFFDB931),
      const Color(0xFF9f7928),
      const Color(0xFF8A6E2F),
      const Color(0xFF5d4a1f),
      const Color(0xFF5d4a1f),
      const Color(0xFFFDB931),
      const Color(0xFFFEDB37)
    ],
    stops: [ 0,.1,.3,.4,.6,.8,1,1.2]
     
    );
  //static const Color matchCard = const Color(0xFF434273);
  static const Color matchCard = const Color(0xaa202020);
  static const Color matchCardVoted = const Color(0xff000000);
  //static const Color matchListBackground = const Color(0xFF3E3963);
  static const Color matchPageBackground = const Color(0xaa000000);
  static const Color matchTitleGrey = const Color(0xffaaaaaa);
  static const Color matchTitle = const Color(0xff000000);
  static const Color matchTitleOnDark = const Color(0xffffffff);
  static const Color matchTitleWin = const Color(0xFF00FF00);
  static const Color matchTitleLoss = const Color(0xFFFF0000);
  static const Color matchLocation = const Color(0xffFFFFFF);
  static const Color matchDistance = const Color(0xffFFFFFF);

}

class Dimens {
  const Dimens();

  static const matchFlagMiniWidth = 68.0;
  static const matchFlagMiniHeight = 68.0;
  static const matchFlagDetailWidth = 150.0;
  static const matchFlagDetailHeight = 150.0;
}


class TextStyles {

  const TextStyles();

  static const TextStyle appBarTitle = const TextStyle(
    color: Colors.appBarTitle,
    fontFamily: "CuteFont",
    fontWeight: FontWeight.w600,
    fontSize: 35.0
  );

  static const TextStyle teamNameDetails = const TextStyle(
    color: Colors.matchTitle,
    fontFamily: "CuteFont",
    fontWeight: FontWeight.w500,
    fontSize: 65.0
  );
static const TextStyle normalTextOnDark = const TextStyle(
    color: Colors.matchTitleOnDark,
    fontFamily: 'CuteFont',
    fontWeight: FontWeight.w600,
    fontSize: 20.0
  );
  static const TextStyle bigTextOnDark = const TextStyle(
    color: Colors.matchTitleOnDark,
    fontFamily: 'CuteFont',
    fontWeight: FontWeight.w600,
    fontSize: 50.0
  );
  static const TextStyle normalText = const TextStyle(
    color: Colors.matchTitle,
    fontFamily: 'CuteFont',
    fontWeight: FontWeight.w600,
    fontSize: 20.0
  );

  static const TextStyle matchTitle = const TextStyle(
    color: Colors.matchTitle,
    fontFamily: 'CuteFont',
    fontWeight: FontWeight.w600,
    fontSize: 19.0
  );

   static const TextStyle matchTeamLoss = const TextStyle(
    color: Colors.matchTitleGrey,
    fontFamily: 'CuteFont',
    fontWeight: FontWeight.w600,
    fontSize: 19.0
  );

  static const TextStyle matchTitleWin = const TextStyle(
    color: Colors.matchTitleWin,
    fontFamily: 'CuteFont',
    fontWeight: FontWeight.w600,
    fontSize: 19.0
  );
   static const TextStyle matchTitleLoss = const TextStyle(
    color: Colors.matchTitleLoss,
    fontFamily: 'CuteFont',
    fontWeight: FontWeight.w600,
    fontSize: 19.0
  );

  static const TextStyle matchLocation = const TextStyle(
    color: Colors.matchLocation,
    fontFamily: 'CuteFont',
    fontWeight: FontWeight.w300,
    fontSize: 18.0
  );

  static const TextStyle matchDistance = const TextStyle(
    color: Colors.matchDistance,
    fontFamily: 'CuteFont',
    fontWeight: FontWeight.w300,
    fontSize: 20.0
  );


}