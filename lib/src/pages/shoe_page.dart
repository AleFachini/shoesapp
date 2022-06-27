import 'package:flutter/material.dart';
import 'package:shoesapp/src/helpers/helpers.dart';
import 'package:shoesapp/src/widgets/widgets_barrel.dart';

class ShoePage extends StatelessWidget {
  ShoePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    changeStatusDark();

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: 'For you'),
          SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Hero(
                      tag:
                          'shoe-1', //El tag es unico por pagina sino no anda!!!
                      child: ShoeSizePreview()),
                  ShoeDescription(
                    title: 'Nike Air Max 720',
                    description:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                ],
              ),
            ),
          ),
          AddToCart(amount: 100.0),
        ],
      ),
    );
  }
}
