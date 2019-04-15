import 'index.dart';

class User {
  final String name;
  bool notifications;
  int points;
  List<Vote> votes = <Vote>[];

   bool getUserVotedTeam(Encounter match, Team team) {
     if (votes !=null) {
     for (Vote vote in this.votes) {
       if (vote.match== match) {
         if (team == vote.team)
         return true;
       }
     }
     }
     
     return false;
  }

  Vote getUserVote(Encounter match) {
     if (votes !=null) {
     for (Vote vote in this.votes) {
       if (vote.match== match) {
         
         return vote;
       }
     }
     }
     
     return Vote(match: match, );
  }

  void vote(Encounter match, Team team) {
    
    bool updated = false;
    for (Vote v in votes) {
      if (v.match == match) {
        v.setTeam(team);
        updated= true;
      }
    }
    if (!updated) { 
      Vote v = Vote(match:match);
      v.setTeam(team);
      votes.add(v);}
  }

  User({this.name,this.notifications=true, this.points=0});
}