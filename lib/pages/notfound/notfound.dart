import 'package:flutter/material.dart';

class NotFound extends StatefulWidget {
  const NotFound({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NotFoundState createState() => _NotFoundState();
}

class _NotFoundState extends State<NotFound> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('404'),
      ),
      body: Container(
        child: const Center(
          child: Text('404'),
        ),
      ),
    );
  }
}
