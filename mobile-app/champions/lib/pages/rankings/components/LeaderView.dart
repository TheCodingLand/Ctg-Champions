import 'package:flutter/material.dart';

class LeaderView extends StatelessWidget {
  const LeaderView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(child:ClipPath()),
    );
  }
}


class nameClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {

  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}