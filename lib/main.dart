import 'package:flutter/material.dart';
import 'package:tooltip/widgets/painter_widget.dart';
import 'package:tooltip/widgets/tooltip_state.dart';
import 'package:tooltip/widgets/tooltip_widget.dart';
void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  OverlayEntry? _overlayEntry;

  bool isAlive=false;

  void removeOverlay(){
    isAlive=false;
    _overlayEntry?.remove();
  }
  void addOverlay(BuildContext context,LayerLink layerLink, int index){
    if(isAlive){
      _overlayEntry?.remove();
    }else{
      isAlive=!isAlive;
    }
      _overlayEntry = createOverlayEntry(context,layerLink,index);
      Overlay.of(context)!.insert(_overlayEntry!);
  }
  final list=[...Colors.primaries,...Colors.primaries,...Colors.primaries];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Colors.black,
        body: ToolTipOverlayState(
          addOverlay: addOverlay,
          isAlive: isAlive,
          overlayEntry:_overlayEntry ,
          child: ListView(
            children: List.generate(list.length, (index) => ToolTipWidget(
              index: index,
              color: list[index],
            )),
          ),
        ),
      ),
    );
  }

  OverlayEntry createOverlayEntry(BuildContext context,LayerLink layerLink, int index) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    return OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: () => removeOverlay(),
        behavior: HitTestBehavior.deferToChild,
        child: Column(
              children: [
                 CompositedTransformFollower(
                   offset:Offset(0, -size.height-32),
                   link: layerLink,
                   showWhenUnlinked: false,
                   child: ConstrainedBox(
                     constraints:  BoxConstraints(
                       minHeight: size.height,
                       maxWidth:300
                     ), 
                     child: Container(
                       margin: const EdgeInsets.only(left: 16),
                       color: Colors.white,
                             child: Padding(
                               padding: const EdgeInsets.all(32.0),
                               child: Text('Tooltip para elemento :$index',
                               maxLines: 1,
                               overflow: TextOverflow.ellipsis,
                                 style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 14),
                               ),
                             ),                           
                     ),
                   ),
                 ),
                CompositedTransformFollower(
                    offset:const Offset(50, 0),
                    link: layerLink,
                    showWhenUnlinked: false,
                    child: CustomPaint(
                      size:  const Size(10,5),
                      painter: MyPainter(),
                  ),
                )
              ],
            ),
      ),
    );
  }
}

