import 'package:flutter/material.dart';
import 'survey_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pesquisa de Satisfação',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SurveyScreen(),
    );
  }
}
