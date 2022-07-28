import 'package:first/pages/route_test/page1/child/tip_route.dart';
import 'package:flutter/material.dart';
import './pages/route_test/page1/page1.dart';
import './pages/route_test/page2/page2.dart';
import './pages/notfound/notfound.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //应用名称
      title: 'Flutter Demo',
      initialRoute: "/", //名为"/"的路由作为应用的home(首页)
      debugShowCheckedModeBanner: false, // 去除右上角debug标识
      theme: ThemeData(
        //主题控制
        primarySwatch: Colors.green,
      ),
      //注册路由表
      routes: {
        "/page1": (context) => const page1(),
        "/page2": (context) => const page2(),
        "/notfound": (context) => const NotFound(),
        "/": (context) =>
            const MyHomePage(title: 'Flutter Demo Home Page'), //注册首页路由
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('步进器:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            // to page1
            TextButton(
              onPressed: () async {
                // 打开`TipRoute`，并等待返回结果
                var result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return TipRoute(
                        // 路由参数
                        text: "我是提示xxxx",
                      );
                    },
                  ),
                );
                //输出`TipRoute`路由返回结果
                print("路由返回值: $result");
              },
              child: const Text("opten tooltips"),
            ),
            TextButton(
              child: const Text("to page1"),
              onPressed: () {
                // 路由传参
                Navigator.of(context)
                    .pushNamed("/page1", arguments: "我是来自page1传递的参数");
              },
            ),
            // to page2
            TextButton(
              child: const Text("to page2"),
              onPressed: () {
                Navigator.pushNamed(context, "/page2");
              },
            ),
            TextButton(
              child: const Text("to notfound"),
              onPressed: () {
                Navigator.pushNamed(context, "/notfound");
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
