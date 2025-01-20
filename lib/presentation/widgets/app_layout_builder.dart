import 'package:flutter/material.dart';

import '../../app/utilities/layout_breakpoints.dart';

class AppLayoutBuilder extends StatelessWidget {
  const AppLayoutBuilder({
    super.key,
    required this.desktop,
    required this.mobile,
    required this.tablet,
  });
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, bc) {
      switch (checkLayout(context)) {
        case LayoutBreakpoints.small:
          return mobile;
        case LayoutBreakpoints.medium:
          return tablet;
        case LayoutBreakpoints.large:
          return desktop;
      }
    });
  }
}
