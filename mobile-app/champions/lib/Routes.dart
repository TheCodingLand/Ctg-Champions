import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'pages/match_detail/MatchDetailPage.dart';

class Routes {
  static final Router _router = Router();


  static var matchDetailHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      print (params);
      return MatchDetailPage(params["id"][0]);
    });

  static void initRoutes() {
    _router.define("/detail/:id", handler: matchDetailHandler);
  }

  static void navigateTo(context, String route, {TransitionType transition}) {
    _router.navigateTo(context, route, transition: transition);
  }

}