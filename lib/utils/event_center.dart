typedef EventHandle = void Function(Event e);

class Event {
  Event({required this.eventName, required this.data});
  final Object eventName;
  final Object data;
}

// 发布订阅
class EventCenter {
  EventCenter();

  /// 事件堆栈
  static final _eventStack = <Object, List<EventHandle>>{};

  //订阅
  void on(eventName, EventHandle f) {
    if (eventName == null || f == null) return;
    // ignore: deprecated_member_use
    _eventStack[eventName] ??= <EventHandle>[];
    _eventStack[eventName]?.add(f);
  }

  //移除，如果不指定回调函数，则删除所有
  void off(eventName, [EventHandle? f]) {
    var list = _eventStack[eventName];
    if (eventName == null || list == null) return;
    if (f != null) {
      list.remove(f);
    }
  }

  //触发事件
  void trigger(eventName, [data]) {
    var list = _eventStack[eventName];
    if (list == null) return;
    int len = list.length - 1;
    final event = Event(eventName: eventName, data: data);
    for (var i = len; i > -1; --i) {
      list[i](event);
    }
  }
}

final EventCenter eventCenter = EventCenter();
