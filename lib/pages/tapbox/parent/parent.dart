import 'package:first/pages/tapbox/parent/child.dart';
import 'package:flutter/material.dart';

// 父Widget管理子Widget的状态,ParentWidget 为 Tapbox 管理状态.

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Tapbox(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}
