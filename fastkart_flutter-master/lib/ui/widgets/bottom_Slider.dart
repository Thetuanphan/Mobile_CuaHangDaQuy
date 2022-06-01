import 'package:fast_cart/constants/colors_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StackOver extends StatefulWidget {
  @override
  _StackOverState createState() => _StackOverState();
}

class _StackOverState extends State<StackOver>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tab bar',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // give the tab bar a height [can change hheight to preferred height]
            Container(
              height: 45,
              decoration: BoxDecoration(
                color: appColorPrimary,
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
              ),
              child: TabBar(
                controller: _tabController,
                // give the indicator a decoration (color and border radius)
                indicator: MD2Indicator(
                  indicatorSize: MD2IndicatorSize.tiny,
                  indicatorHeight: 20,
                  indicatorColor: Colors.white,
                ),

                labelColor: Colors.white,

                unselectedLabelColor: Colors.black,
                tabs: [
                  // first tab [you can add an icon using the icon property]
                  Tab(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('famfkef'),
                        Container(
                          height: 7,
                          width: 7,
                          decoration: BoxDecoration(
                              color: Colors.green, shape: BoxShape.circle),
                        )
                      ],
                    ),
                  ),

                  // second tab [you can add an icon using the icon property]
                  Tab(
                    text: 'Buy Now',
                  ),
                ],
              ),
            ),
            // tab bar view here
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // first tab bar view widget
                  Center(
                    child: Text(
                      'Place Bid',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  // second tab bar view widget
                  Center(
                    child: Text(
                      'Buy Now',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum MD2IndicatorSize {
  tiny,
  normal,
  full,
}

class MD2Indicator extends Decoration {
  final double indicatorHeight;
  final double indicatorWidth;

  final Color indicatorColor;
  final MD2IndicatorSize indicatorSize;

  const MD2Indicator(
      {@required this.indicatorHeight,
      @required this.indicatorColor,
      @required this.indicatorSize,
      this.indicatorWidth});

  @override
  _MD2Painter createBoxPainter([VoidCallback onChanged]) {
    return new _MD2Painter(this, onChanged);
  }
}

class _MD2Painter extends BoxPainter {
  final MD2Indicator decoration;

  _MD2Painter(this.decoration, VoidCallback onChanged)
      : assert(decoration != null),
        super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);

    Rect rect;
    if (decoration.indicatorSize == MD2IndicatorSize.full) {
      rect = Offset(offset.dx,
              (configuration.size.height - decoration.indicatorHeight ?? 3)) &
          Size(configuration.size.width, decoration.indicatorHeight ?? 3);
    } else if (decoration.indicatorSize == MD2IndicatorSize.normal) {
      rect = Offset(offset.dx + 6,
              (configuration.size.height - decoration.indicatorHeight ?? 3)) &
          Size(configuration.size.width - 12, decoration.indicatorHeight ?? 3);
    } else if (decoration.indicatorSize == MD2IndicatorSize.tiny) {
      rect = Offset(offset.dx + configuration.size.width / 2 - 25,
              (configuration.size.height - decoration.indicatorHeight ?? 3)) &
          Size(70, decoration.indicatorHeight ?? 3);
    }

    final Paint paint = Paint();
    paint.color = decoration.indicatorColor ?? Color(0xff1967d2);
    paint.style = PaintingStyle.fill;
    canvas.drawRRect(
        RRect.fromRectAndCorners(rect,
            topRight: Radius.circular(25),
            topLeft: Radius.circular(25),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5)),
        paint);
  }
}
