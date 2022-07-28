import 'package:flutter/material.dart';

class page2 extends StatelessWidget {
  const page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("page2"),
      ),
      body: const Center(
        child: Text("This is new page2"),
      ),
    );
  }
}
