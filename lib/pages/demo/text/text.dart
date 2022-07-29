import 'package:flutter/material.dart';

class TextStr extends StatelessWidget {
  const TextStr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("text"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              "Hello",
              textAlign: TextAlign.left,
            ),
            Text(
              "Lord Memovo",
              textScaleFactor: 1.5,
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18.0,
                  height: 1.2,
                  fontFamily: "Courier",
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed),
            ),
          ],
        ),
      ),
    );
  }
}
