import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:shoesapp/src/pages/shoe_desc_page.dart';
import 'package:shoesapp/src/pages/shoe_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shoes App',
      home: ShoeDescriptionPage(), //ShoePage(),
    );
  }
}
