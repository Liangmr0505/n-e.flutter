import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class Discover extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  static const loadingTag = "##loading##"; //表尾标记
  String _progress = "0%"; //保存进度百分比
  final _words = <String>[loadingTag];

  // init
  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  // 列表数据请求
  void _retrieveData() {
    Future.delayed(const Duration(seconds: 2)).then((e) {
      setState(() {
        //重新构建列表
        _words.insertAll(
          _words.length - 1,
          //每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList(),
        );
      });
    });
  }

  // 标题定义
  Widget Title = const ListTile(
      title: DecoratedBox(
          decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.red, Colors.green]), //背景渐变
              boxShadow: [
                //阴影
                BoxShadow(
                    color: Colors.black54,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 4.0)
              ]),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
            child: Text(
              "滚动监听",
              style: TextStyle(color: Colors.white),
            ),
          )));

  Widget divider1 = const Divider(color: Colors.blue);
  Widget divider2 = const Divider(color: Colors.green);

  // 页面
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('商品列表')),
      body: Scrollbar(
        //进度条
        // 监听滚动通知
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            double progress = notification.metrics.pixels /
                notification.metrics.maxScrollExtent;
            //重新构建
            setState(() {
              _progress = "${(progress * 100).toInt()}%";
            });
            // print("BottomEdge: ${notification.metrics.extentAfter == 0}");
            return false;
            //return true; //放开此行注释后，进度条将失效
          },
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              // Title,
              SizedBox(
                height: 800, //指定列表高度为400
                child: ListView.separated(
                  itemCount: _words.length,
                  itemBuilder: (context, index) {
                    //如果到了表尾
                    if (_words[index] == loadingTag) {
                      //不足100条，继续获取数据
                      if (_words.length - 1 < 100) {
                        //获取数据
                        _retrieveData();
                        //加载时显示loading
                        return Container(
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.center,
                          child: const SizedBox(
                            width: 24.0,
                            height: 24.0,
                            child: CircularProgressIndicator(strokeWidth: 2.0),
                          ),
                        );
                      } else {
                        //已经加载了100条数据，不再获取数据。
                        return Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(16.0),
                          child: const Text(
                            "没有更多了",
                            style: TextStyle(color: Colors.grey),
                          ),
                        );
                      }
                    }
                    //显示单词列表项
                    return ListTile(title: Text(_words[index]));
                  },
                  //分割器构造器
                  separatorBuilder: (BuildContext context, int index) {
                    return index % 2 == 0 ? divider1 : divider2;
                  },
                ),
              ),
              CircleAvatar(
                //显示进度百分比
                radius: 30.0,
                backgroundColor: Colors.black54,
                child: Text(_progress),
              )
            ],
          ),
        ),
      ),
    );
  }
}
