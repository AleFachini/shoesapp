import 'package:flutter/material.dart';
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
            ShoeSizePreview(fullScreen: true),
            Positioned(
              top: 80,
              child: FloatingActionButton(
                onPressed: () {},
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
                Positioned(left: 90, child: _ColorButton(Color(0xffc6d642))),
                Positioned(left: 60, child: _ColorButton(Color(0xffffad29))),
                Positioned(left: 30, child: _ColorButton(Color(0xff2099f1))),
                _ColorButton(Color(0xff364d56)),
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

  _ColorButton(
    this.color,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(color: color!, shape: BoxShape.circle),
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
            OvalButton(
              text: 'Buy now',
              width: 110,
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
