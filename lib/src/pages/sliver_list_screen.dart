import 'package:flutter/material.dart';

class SliverListScreen extends StatelessWidget {
  const SliverListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Expanded(child: _MainScroll()),
          _NewListButton(),
        ],
      ),
    );
  }
}

class _NewListButton extends StatelessWidget {
  const _NewListButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        'CREATE NEW LIST',
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 3),
      ),
      style: ElevatedButton.styleFrom(
          primary: Color(0xFFED6762),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50))),
          minimumSize: Size(size.width * 0.9, 100)),
    );
  }
}

class _MainScroll extends StatelessWidget {
  const _MainScroll({Key? key}) : super(key: key);
  final items = const [
    _ListItem(title: 'Orange', color: Color(0xffF08F66)),
    _ListItem(title: 'Family', color: Color(0xffF2A38A)),
    _ListItem(title: 'Subscriptions', color: Color(0xffF7CDD5)),
    _ListItem(title: 'Books', color: Color(0xffFCEBAF)),
    _ListItem(title: 'Orange', color: Color(0xffF08F66)),
    _ListItem(title: 'Family', color: Color(0xffF2A38A)),
    _ListItem(title: 'Subscriptions', color: Color(0xffF7CDD5)),
    _ListItem(title: 'Books', color: Color(0xffFCEBAF)),
    _ListItem(title: 'Orange', color: Color(0xffF08F66)),
    _ListItem(title: 'Family', color: Color(0xffF2A38A)),
    _ListItem(title: 'Subscriptions', color: Color(0xffF7CDD5)),
    _ListItem(title: 'Books', color: Color(0xffFCEBAF)),
    _ListItem(title: 'Orange', color: Color(0xffF08F66)),
    _ListItem(title: 'Family', color: Color(0xffF2A38A)),
    _ListItem(title: 'Subscriptions', color: Color(0xffF7CDD5)),
    _ListItem(title: 'Books', color: Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
            floating: true,
            delegate: _SliverAppBarCustomDelegate(
                minHeight: 170,
                maxHeight: 200,
                child: Container(
                    color: Colors.white,
                    alignment: Alignment.centerLeft,
                    child: _Title()))),
        SliverList(
            delegate:
                SliverChildListDelegate([...items, SizedBox(height: 100)])),
      ],
    );
  }
}

class _SliverAppBarCustomDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarCustomDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant _SliverAppBarCustomDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            'New',
            style: TextStyle(color: Color(0xFF532128), fontSize: 50),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 35),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                child: Text(
                  'List',
                  style: TextStyle(
                      color: Color(0xFFD93A30),
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(width: 150, height: 8, color: Color(0xFFF7CDD5)),
            ],
          ),
        )
      ],
    );
  }
}

class _TaskList extends StatelessWidget {
  const _TaskList({
    Key? key,
  }) : super(key: key);
  final items = const [
    _ListItem(title: 'Orange', color: Color(0xffF08F66)),
    _ListItem(title: 'Family', color: Color(0xffF2A38A)),
    _ListItem(title: 'Subscriptions', color: Color(0xffF7CDD5)),
    _ListItem(title: 'Books', color: Color(0xffFCEBAF)),
    _ListItem(title: 'Orange', color: Color(0xffF08F66)),
    _ListItem(title: 'Family', color: Color(0xffF2A38A)),
    _ListItem(title: 'Subscriptions', color: Color(0xffF7CDD5)),
    _ListItem(title: 'Books', color: Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => items[index],
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(30),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        title,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
