import 'package:disenos_app/src/themes/app_theme.dart';
import 'package:disenos_app/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeadersScreen extends StatelessWidget {
  const HeadersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final secondary = Provider.of<AppTheme>(context).currentTheme!.colorScheme.secondary;

    return Scaffold(
        body: HeaderInvWave(
      color: secondary,
    ));
  }
}
