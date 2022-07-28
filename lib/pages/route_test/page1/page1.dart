import 'package:flutter/material.dart';

class page1 extends StatelessWidget {
  const page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //获取路由参数
    var text = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text("page1"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text is String ? text : ''),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, "我是返回值"),
                child: const Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
