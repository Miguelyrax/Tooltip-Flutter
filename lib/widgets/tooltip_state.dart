import 'package:flutter/material.dart';
class ToolTipOverlayState extends InheritedWidget {

  final OverlayEntry? overlayEntry;
  final bool isAlive;
  final Function addOverlay;
  final Widget child;

  const ToolTipOverlayState(
    {
      super.key,
      required this.addOverlay,
      required this.overlayEntry,
      required this.child,
      required this.isAlive,
    }) : super(child: child);

  static ToolTipOverlayState? of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ToolTipOverlayState>());
  }

  @override
  bool updateShouldNotify(ToolTipOverlayState oldWidget) {
    return overlayEntry != null;
  }

}