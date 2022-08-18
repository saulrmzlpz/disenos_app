import 'package:disenos_app/src/themes/app_theme.dart';
import 'package:disenos_app/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestScreen extends StatelessWidget {
  const PinterestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
          body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _PinterestGrid(),
          _PinterestMenu(),
        ],
      )),
    );
  }
}

class _PinterestMenu extends StatelessWidget {
  const _PinterestMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final visible = Provider.of<_MenuModel>(context).visible;
    final currentTheme = Provider.of<AppTheme>(context).currentTheme;

    return SafeArea(
      child: PinterestMenu(
        visible: visible,
        backgroundColor: currentTheme!.scaffoldBackgroundColor,
        activeColor: currentTheme.colorScheme.secondary,
        items: [
          PinterestButton(
              onPressed: () {
                print('Icon 1');
              },
              iconData: Icons.pie_chart),
          PinterestButton(
              onPressed: () {
                print('Icon 2');
              },
              iconData: Icons.search),
          PinterestButton(
              onPressed: () {
                print('Icon 3');
              },
              iconData: Icons.notifications),
          PinterestButton(
              onPressed: () {
                print('Icon 4');
              },
              iconData: Icons.account_circle),
        ],
      ),
    );
  }
}

class _PinterestGrid extends StatefulWidget {
  const _PinterestGrid({Key? key}) : super(key: key);

  @override
  State<_PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<_PinterestGrid> {
  final controller = ScrollController();
  double lastScroll = 0;
  @override
  void initState() {
    controller.addListener(() {
      if (controller.offset > lastScroll && controller.offset > 150) {
        Provider.of<_MenuModel>(context, listen: false).visible = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).visible = true;
      }
      lastScroll = controller.offset;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      child: StaggeredGrid.count(
        crossAxisCount: 4,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        children: List.generate(200, (index) => _PinterestItem(index: index)),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class _PinterestItem extends StatelessWidget {
  const _PinterestItem({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<AppTheme>(context).currentTheme;

    return StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: index.isEven ? 2 : 3,
      child: Container(
        decoration: BoxDecoration(
          color: currentTheme!.colorScheme.secondary,
          borderRadius: BorderRadius.circular(30),
        ),
        margin: const EdgeInsets.all(5),
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(index.toString()),
          ),
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  bool _visible = true;

  bool get visible => _visible;

  set visible(bool condition) {
    _visible = condition;
    notifyListeners();
  }
}
