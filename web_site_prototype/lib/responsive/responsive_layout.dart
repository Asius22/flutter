import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:web_site_prototype/responsive/desktop_layout.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout(
      {Key? key,
      required this.desktopLayout,
      required this.smartPhoneLayout,
      required this.tabletLayout})
      : super(key: key);
  final Widget desktopLayout, tabletLayout, smartPhoneLayout;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 450) {
          return smartPhoneLayout;
        } else if (constraints.maxWidth < 1000) {
          return tabletLayout;
        } else {
          return desktopLayout;
        }
      },
    );
  }
}
