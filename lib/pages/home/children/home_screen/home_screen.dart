// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  String icons = "\uE03e\uE237\uE237";

  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = true; //维护复选框状态

  void initState() {
    super.initState();
    print('HomeScreen init');
  }

  void _onPressed() {
    print('click');
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(title: Text('HomeScreen')),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                child: const Text("按钮"),
                onPressed: () => print('我被点击了'),
              ),
              TextButton(
                child: Text("normal"),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.thumb_up),
                onPressed: () {},
              ),
              ElevatedButton.icon(
                icon: Icon(Icons.send),
                label: Text("发送"),
                onPressed: _onPressed,
              ),
              TextButton.icon(
                icon: Icon(Icons.info),
                label: Text("详情"),
                onPressed: _onPressed,
              ),
              // Image(
              //   image: NetworkImage(
              //       "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
              //   width: 100.0,
              // ),
              // // api提供快捷构造函数生成图片
              // Image.network(
              //   "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
              //   width: 100.0,
              // ),
              // Image(
              //   image: NetworkImage(
              //       "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
              //   width: 100.0,
              //   color: Colors.blue,
              //   colorBlendMode: BlendMode.difference,
              // ),
              Text(
                icons,
                style: TextStyle(
                  fontFamily: "MaterialIcons",
                  fontSize: 24.0,
                  color: Colors.green,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Icon(Icons.accessible, color: Colors.green),
                  Icon(Icons.error, color: Colors.green),
                  Icon(Icons.fingerprint, color: Colors.green),
                ],
              ),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 80.0, height: 80.0),
                child: redBox,
              ),
              Switch(
                value: _switchSelected, //当前状态
                onChanged: (value) {
                  //重新构建页面
                  setState(() {
                    _switchSelected = value;
                  });
                },
              ),
              Checkbox(
                value: _checkboxSelected,
                activeColor: Colors.red, //选中时的颜色
                onChanged: (value) {
                  setState(() {
                    _checkboxSelected = value!;
                  });
                },
              ),
              TextField(
                autofocus: true,
                onChanged: (v) {
                  print("onChange: $v");
                },
                decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "用户名或邮箱",
                    prefixIcon: Icon(Icons.person)),
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "您的登录密码",
                    prefixIcon: Icon(Icons.lock)),
                obscureText: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget redBox = DecoratedBox(
  decoration: BoxDecoration(color: Colors.red),
);
