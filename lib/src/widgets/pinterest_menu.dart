import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestMenu extends StatelessWidget {
  const PinterestMenu({
    Key? key,
    this.visible = true,
    this.backgroundColor = Colors.white,
    this.activeColor = Colors.black,
    this.secondaryColor = Colors.blueGrey,
    required this.items,
  }) : super(key: key);

  final bool visible;
  final Color backgroundColor;
  final Color activeColor;
  final Color secondaryColor;

  final List<PinterestButton> items;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 250),
        opacity: visible ? 1 : 0,
        child: Builder(
          builder: (context) {
            Provider.of<_MenuModel>(context, listen: false).backgroundColor =
                backgroundColor;
            Provider.of<_MenuModel>(context, listen: false).activeColor =
                activeColor;
            Provider.of<_MenuModel>(context, listen: false).secondaryColor =
                secondaryColor;
            return _PinterestMenuBackground(
              child: _MenuItems(items: items),
            );
          },
        ),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  const _PinterestMenuBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          boxShadow: const [
            BoxShadow(color: Colors.black54, blurRadius: 10, spreadRadius: -5)
          ]),
      width: 250,
      height: 60,
      child: child,
    );
  }
}

class PinterestButton {
  final VoidCallback onPressed;
  final IconData iconData;

  PinterestButton({required this.onPressed, required this.iconData});
}

class _MenuItems extends StatelessWidget {
  const _MenuItems({Key? key, required this.items}) : super(key: key);
  final List<PinterestButton> items;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(items.length,
          (index) => _PinterestMenuItem(index: index, button: items[index])),
    );
  }
}

class _PinterestMenuItem extends StatelessWidget {
  const _PinterestMenuItem(
      {Key? key, required this.index, required this.button})
      : super(key: key);
  final int index;
  final PinterestButton button;

  @override
  Widget build(BuildContext context) {
    final mModel = Provider.of<_MenuModel>(context);
    return IconButton(
      onPressed: () {
        Provider.of<_MenuModel>(context, listen: false).currentIndex = index;
        button.onPressed();
      },
      icon: AnimatedScale(
        scale: mModel.currentIndex == index ? 1.3 : 1,
        duration: const Duration(milliseconds: 100),
        child: Icon(
          button.iconData,
          size: 25,
          color: mModel.currentIndex == index
              ? mModel.activeColor
              : mModel.secondaryColor,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _currentIndex = 0;

  Color? _backgroundColor;
  Color? _activeColor;
  Color? _secondaryColor;

  Color? get backgroundColor => _backgroundColor;

  set backgroundColor(Color? color) {
    _backgroundColor = color;
  }

  Color? get activeColor => _activeColor;

  set activeColor(Color? color) {
    _activeColor = color;
  }

  Color? get secondaryColor => _secondaryColor;

  set secondaryColor(Color? color) {
    _secondaryColor = color;
  }

  int get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
