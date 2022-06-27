import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/src/models/shoe_model.dart';
import 'package:shoesapp/src/widgets/widgets_barrel.dart';

class ShoeDescriptionPage extends StatelessWidget {
  ShoeDescriptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            Hero(tag: 'shoe-1', child: ShoeSizePreview(fullScreen: true)),
            Positioned(
              top: 80,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                  size: 60,
                ),
                elevation: 0,
                highlightElevation: 0,
                backgroundColor: Colors.transparent,
              ),
            )
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ShoeDescription(
                  title: 'Nike Air Max 720',
                  description:
                      "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                ),
                _AmountAndBuy(),
                _ColorPalletteRow(),
                _BottomBarOptions(),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}

class _BottomBarOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _ButtonOption(
              icon: Icon(Icons.star,
                  size: 25, color: Colors.grey.withOpacity(0.4))),
          _ButtonOption(
              icon: Icon(Icons.add_shopping_cart,
                  size: 25, color: Colors.grey.withOpacity(0.4))),
          _ButtonOption(
              icon: Icon(Icons.settings,
                  size: 25, color: Colors.grey.withOpacity(0.4))),
        ],
      ),
    );
  }
}

class _ButtonOption extends StatelessWidget {
  final Icon icon;

  _ButtonOption({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 5,
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ]),
      child: icon,
    );
  }
}

class _ColorPalletteRow extends StatelessWidget {
  _ColorPalletteRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                    left: 90,
                    child: _ColorButton(
                        Color(0xffc6d642), 4, 'assets/imgs/verde.png')),
                Positioned(
                    left: 60,
                    child: _ColorButton(
                        Color(0xffffad29), 3, 'assets/imgs/amarillo.png')),
                Positioned(
                    left: 30,
                    child: _ColorButton(
                        Color(0xff2099f1), 2, 'assets/imgs/azul.png')),
                _ColorButton(Color(0xff364d56), 1, 'assets/imgs/negro.png'),
              ],
            ),
          ),
          OvalButton(
            text: 'More Options',
            height: 30,
            width: 160,
            color: Color(0xffffc675),
          ),
        ],
      ),
    );
  }
}

class _ColorButton extends StatelessWidget {
  final Color? color;
  final int index;
  final String urlImage;

  _ColorButton(this.color, this.index, this.urlImage);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: index * 100),
      duration: Duration(milliseconds: 400),
      child: GestureDetector(
        onTap: () {
          final shoeModel = Provider.of<ShoeModel>(context, listen: false);
          shoeModel.assetImage = urlImage;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(color: color!, shape: BoxShape.circle),
        ),
      ),
    );
  }
}

class _AmountAndBuy extends StatelessWidget {
  _AmountAndBuy({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          children: [
            Text(
              '\$180.0',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Bounce(
              delay: Duration(milliseconds: 1000),
              from: 8,
              child: OvalButton(
                text: 'Buy now',
                width: 110,
                height: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
