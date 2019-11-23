import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Page1()));

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PageRouteAnimation")),
      body: Center(
        child: RaisedButton(
          child: Text("Go!"),
          onPressed: () {
            Navigator.of(context).push(_createRoute());
          },
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Page2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final begin = Offset(0.0, 1.0);
      final end = Offset.zero;
      final curve = Curves.ease;

      final tween =Tween(begin: begin, end: end)
      final curevedAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      return SlideTransition(
        position: tween.animate(curevedAnimation),
        child: child,
      );
    },
  );
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("sample")),
      body: Center(
        child: Text("Page 2"),
      ),
    );
  }
}
