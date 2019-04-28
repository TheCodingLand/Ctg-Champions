import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'pages/match_detail/MatchDetailPage.dart';
import 'pages/rankings/RankingPage.dart';
class Routes {
  static final Router _router = Router();

  static var showRankingsHandler = Handler(
     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      //print (params);
      return RankingPage();
    });

  static var matchDetailHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      //print (params);
      return MatchDetailPage(params["id"][0]);
    });

  static void initRoutes() {
    _router.define("/detail/:id", handler: matchDetailHandler);
    _router.define("/rankings", handler: showRankingsHandler);
    
  }

  static void navigateTo(context, String route, {TransitionType transition}) {
    _router.navigateTo(context, route, transition: transition);
  }

}