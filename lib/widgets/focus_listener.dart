import 'package:flutter/material.dart';

class FocusListener extends StatefulWidget {
  final FocusNode focusNode;
  final Widget Function(bool hasFocus) builder;

  const FocusListener({
    super.key,
    required this.builder,
    required this.focusNode,
  });

  @override
  State<FocusListener> createState() => _FocusListenerState();
}

class _FocusListenerState extends State<FocusListener> {
  late final focusNode = widget.focusNode;

  @override
  void initState() {
    focusNode.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(focusNode.hasFocus);
  }
}
