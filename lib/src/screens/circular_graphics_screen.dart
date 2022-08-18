import 'package:disenos_app/src/themes/app_theme.dart';
import 'package:disenos_app/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CircularGraphicsScreen extends StatefulWidget {
  const CircularGraphicsScreen({Key? key}) : super(key: key);

  @override
  State<CircularGraphicsScreen> createState() => _CircularGraphicsScreenState();
}

class _CircularGraphicsScreenState extends State<CircularGraphicsScreen> {
  double percent = 0;

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<AppTheme>(context).currentTheme;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: 150,
                    height: 150,
                    child: RadialProgress(
                      percent: percent,
                      progressColor: Colors.cyan,
                      backgroundColor: currentTheme!.textTheme.caption!.color,
                      progressRounded: true,
                    )),
                SizedBox(
                    width: 150,
                    height: 150,
                    child: RadialProgress(
                      percent: percent,
                      progressColor: Colors.pink,
                      backgroundColor: currentTheme.textTheme.caption!.color,
                      progressRounded: true,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: 150,
                    height: 150,
                    child: RadialProgress(
                      percent: percent,
                      progressColor: Colors.green,
                      backgroundColor: currentTheme.textTheme.caption!.color,
                      progressRounded: true,
                      progressGradientColor: LinearGradient(colors: [Colors.red, Colors.black]),
                    )),
                SizedBox(
                    width: 150,
                    height: 150,
                    child: RadialProgress(
                      percent: percent,
                      progressColor: Colors.orange,
                      backgroundColor: currentTheme.textTheme.caption!.color,
                      progressRounded: true,
                    )),
              ],
            ),
            Text(
              '$percent%',
              style: const TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            percent += 10;
            if (percent > 100) {
              percent = 0;
            }
          });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
