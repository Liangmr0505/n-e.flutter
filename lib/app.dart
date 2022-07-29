import 'package:first/pages/home/home.dart';
import 'package:flutter/material.dart';

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
        "/": (context) => Home(),
      },
    );
  }
}
