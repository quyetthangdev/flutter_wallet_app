import 'package:flutter/material.dart';

enum PageTransitionType {
  fade,
  rightToLeft,
  leftToRight,
  upToDown,
  downToUp,
  scale,
  rotate,
  size,
  rightToLeftWithFade,
  leftToRightWithFade,
}

class PageTransition extends PageRouteBuilder {
  final Widget child;
  final PageTransitionType type;
  final Curve curve;
  final Alignment alignment;
  final Duration duration;

  PageTransition({
    required this.child,
    this.type = PageTransitionType.rightToLeft,
    this.curve = Curves.easeInOut,
    this.alignment = Alignment.center,
    this.duration = const Duration(milliseconds: 300),
    RouteSettings? settings,
  }) : super(
         pageBuilder: (
           BuildContext context,
           Animation<double> animation,
           Animation<double> secondaryAnimation,
         ) {
           return child;
         },
         transitionDuration: duration,
         settings: settings,
         transitionsBuilder: (
           BuildContext context,
           Animation<double> animation,
           Animation<double> secondaryAnimation,
           Widget child,
         ) {
           switch (type) {
             case PageTransitionType.fade:
               return FadeTransition(opacity: animation, child: child);
             case PageTransitionType.rightToLeft:
               return SlideTransition(
                 position: Tween<Offset>(
                   begin: const Offset(1, 0),
                   end: Offset.zero,
                 ).animate(animation),
                 child: child,
               );
             case PageTransitionType.leftToRight:
               return SlideTransition(
                 position: Tween<Offset>(
                   begin: const Offset(-1, 0),
                   end: Offset.zero,
                 ).animate(animation),
                 child: child,
               );
             case PageTransitionType.upToDown:
               return SlideTransition(
                 position: Tween<Offset>(
                   begin: const Offset(0, -1),
                   end: Offset.zero,
                 ).animate(animation),
                 child: child,
               );
             case PageTransitionType.downToUp:
               return SlideTransition(
                 position: Tween<Offset>(
                   begin: const Offset(0, 1),
                   end: Offset.zero,
                 ).animate(animation),
                 child: child,
               );
             case PageTransitionType.scale:
               return ScaleTransition(
                 scale: animation,
                 alignment: alignment,
                 child: child,
               );
             case PageTransitionType.rotate:
               return RotationTransition(
                 turns: animation,
                 alignment: alignment,
                 child: child,
               );
             case PageTransitionType.size:
               return SizeTransition(
                 sizeFactor: animation,
                 child: child,
                 axisAlignment: 0.0,
               );
             case PageTransitionType.rightToLeftWithFade:
               return SlideTransition(
                 position: Tween<Offset>(
                   begin: const Offset(1, 0),
                   end: Offset.zero,
                 ).animate(animation),
                 child: FadeTransition(opacity: animation, child: child),
               );
             case PageTransitionType.leftToRightWithFade:
               return SlideTransition(
                 position: Tween<Offset>(
                   begin: const Offset(-1, 0),
                   end: Offset.zero,
                 ).animate(animation),
                 child: FadeTransition(opacity: animation, child: child),
               );
             default:
               return FadeTransition(opacity: animation, child: child);
           }
         },
       );
}
