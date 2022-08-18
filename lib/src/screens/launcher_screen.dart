// ignore_for_file: unnecessary_const

import 'package:disenos_app/src/routes/routes.dart';
import 'package:disenos_app/src/themes/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LauncherScreen extends StatelessWidget {
  const LauncherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Diseños en Flutter')),
      drawer: _MainMenu(),
      body: const _OptionsList(),
    );
  }
}

class _MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<AppTheme>(context);
    final secondary = appTheme.currentTheme?.colorScheme.secondary;

    return Drawer(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              padding: const EdgeInsets.all(20),
              width: double.maxFinite,
              height: 200,
              child: CircleAvatar(
                  backgroundColor: secondary,
                  child: const Text(
                    'SR',
                    style: TextStyle(fontSize: 50),
                  )),
            ),
          ),
          const Expanded(child: const _OptionsList()),
          ListTile(
            leading: Icon(Icons.lightbulb_rounded, color: secondary),
            title: const Text('Dark Mode'),
            trailing: Switch.adaptive(
              value: appTheme.darkTheme,
              activeColor: secondary,
              onChanged: (value) {
                appTheme.darkTheme = value;
              },
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.add_to_home_screen,
              color: secondary,
            ),
            title: const Text('Custom Theme'),
            trailing: Switch.adaptive(
              value: appTheme.customTheme,
              activeColor: secondary,
              onChanged: (value) {
                appTheme.customTheme = value;
              },
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}

class _OptionsList extends StatelessWidget {
  const _OptionsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<AppTheme>(context).currentTheme;

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: AppRoutes.screenRoutes.length,
      itemBuilder: (context, index) => ListTile(
        leading: FaIcon(
          AppRoutes.screenRoutes[index].icon,
          color: currentTheme?.colorScheme.secondary,
        ),
        title: Text(AppRoutes.screenRoutes[index].title),
        trailing: Icon(
          Icons.chevron_right,
          color: currentTheme?.colorScheme.secondary,
        ),
        onTap: () => Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (_) => AppRoutes.screenRoutes[index].screen,
            )),
      ),
    );
  }
}
