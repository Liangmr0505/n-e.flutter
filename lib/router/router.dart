import '../pages/notfound/notfound.dart';
import '../pages/route_test/page1/page1.dart';
import '../pages/route_test/page2/page2.dart';

List<Map<String, dynamic>> routes = [
  {
    'path': '/page1', // 默认路由，必填
    'name': 'page1',
    'widget': (
        {Map<String, dynamic>? params, required Map<String, dynamic> query}) {
      return const page1();
    },
  },
  {
    'path': '/page2', // 默认路由，必填
    'name': 'page2',
    'widget': (
        {Map<String, dynamic>? params, required Map<String, dynamic> query}) {
      return const page2();
    },
  },
  {
    'path': '*',
    'widget': (
        {Map<String, dynamic>? params, required Map<String, dynamic> query}) {
      return NotFound();
    },
  },
];
