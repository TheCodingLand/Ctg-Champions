import 'package:flutter/material.dart';
import 'package:champions/models/Encounter.dart';

class MatchesListWidget extends InheritedWidget {

    final List<Encounter> matches;
    const MatchesListWidget(
    key,
    child,
    this.matches ) : super(key: key, child: child);

    @override
    bool updateShouldNotify(MatchesListWidget old) => matches != old.matches;

    static MatchesListWidget of(BuildContext context) {
      return context.inheritFromWidgetOfExactType(MatchesListWidget);
    }


    }
