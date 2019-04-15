
import 'index.dart';

class Vote {
  final Encounter match;
  Team team;
  
  String result;

  void setTeam(t){
    this.team = t;
  }
  void setResult(r) {
    this.result = r;
  }


  Vote({this.match});
  

}