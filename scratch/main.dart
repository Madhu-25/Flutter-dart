import 'package:flutter/material.dart';

import 'UI/home.dart';

//stateless widget -> no internal state , nothing changes when app reloads eg, button
//stateful widget -> internal state, changes when app is reloaded eg, text field ; setState() method changes the internal state of the widget.
//                -> has a state object to store the current state of the widget


void main() {
  runApp( new MaterialApp(
    home: ScaffoldExample(),
  ));
}
