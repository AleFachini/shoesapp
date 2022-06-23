import 'package:flutter/material.dart';
import 'package:shoesapp/src/widgets/widgets_barrel.dart';

class ShoePage extends StatelessWidget {
  ShoePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: 'For you'),
          SizedBox(height: 20),
          ShoeSizePreview(),
        ],
      ),
    );
  }
}
