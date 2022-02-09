import 'package:flutter/material.dart';

import 'package:chat_private/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Private Char',
      initialRoute: 'chat',
      routes: appRoutes,
    );
  }
}
