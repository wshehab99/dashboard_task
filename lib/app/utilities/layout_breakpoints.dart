import 'package:flutter/material.dart';

enum LayoutBreakpoints {
  small,
  medium,
  large,
}

LayoutBreakpoints checkLayout(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < 600) {
    return LayoutBreakpoints.small;
  } else if (width < 1200) {
    return LayoutBreakpoints.medium;
  } else {
    return LayoutBreakpoints.large;
  }
}
