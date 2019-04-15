import 'package:flutter/material.dart';
import 'package:champions/ThemeBis.dart' as Theme;
class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
        child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.Colors.ctgColor)),
      );
}
