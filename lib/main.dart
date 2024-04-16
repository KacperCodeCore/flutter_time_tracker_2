import 'dart:io';
import 'package:flutter/material.dart';
import 'package:win32/win32.dart';
import 'package:window_manager/window_manager.dart';

void main() {
  const double miniWidth = 120;
  const double miniHeight = 30; 

  WidgetsFlutterBinding.ensureInitialized();
  WindowManager.instance.ensureInitialized();
  WindowManager.instance.setTitleBarStyle(TitleBarStyle.hidden);
  WindowManager.instance.setResizable(false);
  WindowManager.instance.popUpWindowMenu();
  // await windowManager.setVisibleOnAllWorkspaces(true);

  WindowManager.instance.setMinimumSize(const Size(miniWidth, miniHeight));
  WindowManager.instance.setMaximumSize(const Size(miniWidth, miniHeight));
  WindowManager.instance.setSize(const Size(miniWidth, miniHeight));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyWindow(),
    );
  }
}

class MyWindow extends StatelessWidget {
  final double normalWidth = 200;
  final double normalHeight = 80;

  // double choosingWidth = 200;
  // double choosingHeight = 300;

  double largeWidth = 100;
  double largeHeight = 120;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // state icon
            Container(
              width: 60,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.brown.shade200,
              ),
              child: MaterialButton(
                onPressed: () {
                  WindowManager.instance
                      .setMinimumSize(Size(largeWidth, largeHeight));
                  WindowManager.instance
                      .setMaximumSize(Size(largeWidth, largeHeight));
                  WindowManager.instance.setResizable(true);
                  WindowManager.instance.setSize(Size(largeWidth, largeHeight));
                  // WindowManager.instance.setTitleBarStyle(TitleBarStyle.normal);
                },
                child: Text('🔄️'),
              ),
            ),
            // state timer
            Container(
              width: 60,
              height: 30,
              color: Colors.brown.shade300,
              child: GestureDetector(
                onPanUpdate: (details) {
                  WindowManager.instance.startDragging();
                },
                child: Center(
                    child: Text(
                  "11:34",
                  style: TextStyle(fontSize: 20),
                )),
              ),
            )
          ],
        )),
      ),
    );
  }
}
