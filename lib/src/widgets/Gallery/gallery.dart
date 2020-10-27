import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class Gallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final topCardHeight = Get.height / 3.5;
    final horizontalListHeight = 180.0;
    return Container(
      height: topCardHeight + 50,
      child: Stack(
        children: <Widget>[
          Positioned(
            height: topCardHeight,
            left: 0.0,
            right: 0.0,
            child: Placeholder(),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: topCardHeight - horizontalListHeight / 1.5,
            height: horizontalListHeight,
            child: PhotoList(),
          )
        ],
      ),
    );
  }
}

class PhotoList extends StatefulWidget {
  @override
  _PhotoListState createState() => _PhotoListState();
}

class _PhotoListState extends State<PhotoList> {
  final items = List.generate(10, (index) => index);
  final _animatedListKey = GlobalKey<AnimatedListState>();
  final _pageController = PageController();

  double _page = 0.0;

  _listenScroll() {
    setState(() {
      _page = _pageController.page;
    });
  }

  @override
  void initState() {
    _pageController.addListener(_listenScroll);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_listenScroll);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _animatedListKey,
      controller: _pageController,
      physics: PageScrollPhysics(),
      itemBuilder: (context, index, animation) {
        final itemInteger = items[index];
        final percent = _page - _page.floor();
        final factor = percent > 0.5 ? (1 - percent) : percent;
        return InkWell(
          onTap: () {
            items.insert(items.length, itemInteger);
            _animatedListKey.currentState.insertItem(items.length - 1);
            final itemToDelete = itemInteger;
            items.removeAt(index);
            _animatedListKey.currentState.removeItem(
              index,
              (context, animation) => FadeTransition(
                opacity: animation,
                child: SizeTransition(
                  sizeFactor: animation,
                  axis: Axis.horizontal,
                  child: PhotoListItem(
                    index: itemToDelete,
                  ),
                ),
              ),
            );
          },
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(
                vector.radians(
                  90 * factor,
                ),
              ),
            child: PhotoListItem(index: itemInteger),
          ),
        );
      },
      scrollDirection: Axis.horizontal,
      initialItemCount: items.length,
    );
  }
}

class PhotoListItem extends StatelessWidget {
  final int index;

  const PhotoListItem({
    Key key,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          color: Colors.primaries[index % Colors.primaries.length],
          width: 150,
          child: FittedBox(
            child: Text(index.toString()),
          ),
        ),
      ),
    );
  }
}
