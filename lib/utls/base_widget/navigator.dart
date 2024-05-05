import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';

class AnimationNav extends PageRouteBuilder {
  final Widget page;

  AnimationNav({
    required this.page,
  }) : super(
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) =>
                page,
            transitionDuration: const Duration(
              milliseconds: 200,
            ),
            reverseTransitionDuration: const Duration(
              milliseconds: 200,
            ),
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) {
              return FadeScaleTransition(animation: animation, child: child);
            });
}

navigatorWid({required Widget page, context, returnPage = false, arguments}) {
  return Navigator.pushAndRemoveUntil(
    context,
    AnimationNav(page: page),
    (Route route) => returnPage,
  );
}
