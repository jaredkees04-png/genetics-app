import 'package:flutter/material.dart';

import '../features/home/home_screen.dart';
import 'theme.dart';

class GeneticsApp extends StatelessWidget {
  const GeneticsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Livestock Genetics',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      home: const HomeScreen(),
    );
  }
}
