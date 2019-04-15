import 'package:flutter/material.dart';
import 'package:champions/models/index.dart';

class _MyInheritedUser extends InheritedWidget {
  _MyInheritedUser({
    Key key,
    @required Widget child,
    @required this.data,
  }) : super(key: key, child: child);

  final MyInheritedUserWidgetState data;

  @override
  bool updateShouldNotify(_MyInheritedUser oldWidget) {
    return true;
  }
}

class MyInheritedUserWidget extends StatefulWidget {

  
  MyInheritedUserWidget({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  MyInheritedUserWidgetState createState() => MyInheritedUserWidgetState();


  static MyInheritedUserWidgetState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_MyInheritedUser)
            as _MyInheritedUser)
        .data;
  }
}

class MyInheritedUserWidgetState extends State<MyInheritedUserWidget> {
  User user = User(name: "Julien", notifications: true);

  void vote(Encounter match, Team team) {
    setState(() {
      user.vote(match, team);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new _MyInheritedUser(
      data: this,
      child: widget.child,
    );
  }
}
