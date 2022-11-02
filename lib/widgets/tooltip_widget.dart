import 'package:flutter/material.dart';
import 'package:tooltip/widgets/tooltip_state.dart';

class ToolTipWidget<T> extends StatefulWidget {
  final Color color;
  final int index;

  const ToolTipWidget({
    Key? key,
    required this.color, required this.index,
  }) : super(key: key);

  @override
  State<ToolTipWidget> createState() => _ToolTipWidgetState<T>();
}

class _ToolTipWidgetState<T> extends State<ToolTipWidget<T>>
  with TickerProviderStateMixin {
  final LayerLink _layerLink = LayerLink();

  @override
  Widget build(BuildContext context) {
    final overlayState = ToolTipOverlayState.of(context);
    return CompositedTransformTarget(
      link: _layerLink,
      child: InkWell(
        onTap:()=>overlayState?.addOverlay(context,_layerLink,widget.index),
        child: Container(
          padding: const EdgeInsets.all(16),
          color: widget.color,
          width: double.infinity,
          child: Text('Elemento :${widget.index}'),
        )
      ),
    );
  }


}
