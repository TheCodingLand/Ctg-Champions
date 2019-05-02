import 'Encounter.dart';
import 'package:http/http.dart' as http;

import 'index.dart';
import 'dart:async';
import 'dart:io';
class MatchesDao {
  getData() {
    Future<http.Response> fetchPost() {
  return http.get(
    'https://jsonplaceholder.typicode.com/posts/1',
    // Send authorization headers to the backend
    headers: {HttpHeaders.authorizationHeader: "ef659ae3406542939e99e121d51719eb"},
  );
  
  }
  }
  static DateTime date = DateTime.now();
  static const Team england = Team(flagImage:"assets/flags/England.png", name: "England" );
  static const Team france = Team(flagImage:"assets/flags/France.png", name: "France" );
  static const Team germany = Team(flagImage:"assets/flags/Germany.png", name: "Germany" );
  static const Team italy = Team(flagImage:"assets/flags/Italy.png", name: "Italy" );
  static const Team spain = Team(flagImage:"assets/flags/Spain.png", name: "Spain" );
  static const Team belgium = Team(flagImage:"assets/flags/Belgium.png", name: "Belgium" );
  static const Team scotland = Team(flagImage:"assets/flags/Scotland.png", name: "Scotland" );
  static const Team ireland = Team(flagImage:"assets/flags/Ireland.png", name: "Ireland" );



  static Encounter match1 = Encounter(
        id: "1",
        name: "Group 1 first match",
        date: DateTime(date.year, date.month, date.day, date.hour, date.minute).subtract(Duration(hours:2)),
        location: "London",
        teamAway: france,
        teamHome: england,
        scoreAway: 2,
        scoreHome: 0,
        ended: true,
        drawPossible: true
    );
    static Encounter match2 = Encounter(
        id: "2",
        name: "Group 1 second match",
        date: DateTime(date.year, date.month, date.day, date.hour, date.minute).subtract(Duration(hours:1)),
        location: "London",
        teamAway: ireland,
        teamHome: belgium,
        scoreAway: 2,
        scoreHome: 0,
        ended: true,
        drawPossible: true
    );
  static Encounter match3 = Encounter(
        id: "3",
        name: "Group 1 second match",
        date: DateTime(date.year, date.month, date.day, date.hour, date.minute).subtract(Duration(hours:1)),
        location: "London",
        teamAway: scotland,
        teamHome: germany,
        scoreAway: 2,
        scoreHome: 0,
        ended: false,
        drawPossible: true
    );
  

  static  Encounter match4 = Encounter(
        id: "4",
        name: "Group 2 first match",
        date: DateTime(date.year, date.month, date.day, date.hour, date.minute).add(Duration(hours:2)),
        location: "London",
        teamAway: italy,
        teamHome: spain,
        scoreAway: 0,
        scoreHome: 0,
        ended: false,
        drawPossible: true
    );
  static  Encounter match5 =Encounter(
        id: "5",
        name: "Group 1 first match",
        date: DateTime(date.year, date.month, date.day, date.hour, date.minute).add(Duration(days:1)),
        location: "Paris",
        teamAway: belgium,
        teamHome: germany,
        scoreAway: 0,
        scoreHome: 0,
        ended: false,
        drawPossible: true
    );
  static  Encounter match6 =Encounter(
        id: "6",
        name: "Group 1 first match",
        date: DateTime(date.year, date.month, date.day, date.hour, date.minute).add(Duration(days:5,hours:4, minutes:15)),
        location: "Paris",
       teamAway: scotland,
        teamHome: england,
        scoreAway: 0,
        scoreHome: 0,
        ended: false,
        drawPossible: true
    );
  static  Encounter match7 =Encounter(
        id: "7",
        name: "Group 1 first match",
        date: DateTime(date.year, date.month, date.day, date.hour, date.minute).add(Duration(days:10,hours:4, minutes:15)),
        location: "Paris",
        teamAway: france,
        teamHome: england,
        scoreAway: 0,
        scoreHome: 0,
        ended: false,
        drawPossible: true
    );
 

  static final List<Event> events = [];
  

  static final List<Encounter> matches = [
    
   match1,match2,match3,match4,match5, match6, match7
    
    
    

  ];
  static bool addEncounter() {
      Encounter m = Encounter(
        id: '${MatchesDao.matches.length + 1}',
        name: "Group 1 first match",
        date: DateTime(date.year, date.month, date.day, date.hour, date.minute).add(Duration(days:15,hours:4, minutes:15)),
        location: "Paris",
        teamAway: france,
        teamHome: england,
        scoreAway: 0,
        scoreHome: 0,
        ended: false,
        
        drawPossible: true
    );
    
      //print('adding an new match : ${m.location}');
      matches.add(m);
  return true;
  }

  static Encounter getEncounterById(id) {
    return matches.where((p) => p.id == id).first;
  }
}