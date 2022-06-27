import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/src/models/shoe_model.dart';
import 'package:shoesapp/src/pages/shoe_desc_page.dart';

class ShoeSizePreview extends StatelessWidget {
  final bool fullScreen;

  ShoeSizePreview({this.fullScreen = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!fullScreen) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ShoeDescriptionPage()));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: fullScreen ? 5 : 30,
          vertical: fullScreen ? 0 : 5,
        ),
        child: Container(
          width: double.infinity,
          height: fullScreen ? 410 : 430,
          decoration: BoxDecoration(
            color: Color(0xffffcf53),
            borderRadius: fullScreen
                ? BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )
                : BorderRadius.circular(50),
          ),
          child: Column(
            children: [
              _ShoeWithShadow(),
              if (!fullScreen) _ShoeSizes(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ShoeSizes extends StatelessWidget {
  _ShoeSizes({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _SizeTile(7),
          _SizeTile(7.5),
          _SizeTile(8),
          _SizeTile(8.5),
          _SizeTile(9),
          _SizeTile(9.5),
        ],
      ),
    );
  }
}

class _SizeTile extends StatelessWidget {
  final double sizeFeet;

  _SizeTile(this.sizeFeet);

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);

    return GestureDetector(
      onTap: () {
        shoeModel.talla = this.sizeFeet;
      },
      child: Container(
        alignment: Alignment.center,
        width: 45,
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:
                sizeFeet == shoeModel.talla ? Color(0xfff1a23a) : Colors.white,
            boxShadow: sizeFeet == shoeModel.talla
                ? [
                    BoxShadow(
                        color: Color(0xffeaa14e),
                        blurRadius: 10,
                        offset: Offset(5, 10))
                  ]
                : []),
        child: Text(
          '${sizeFeet.toString().replaceAll('.0', '')}',
          style: TextStyle(
            color:
                sizeFeet == shoeModel.talla ? Colors.white : Color(0xfff1a23a),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _ShoeWithShadow extends StatelessWidget {
  _ShoeWithShadow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);

    return Padding(
      padding: EdgeInsets.all(50),
      child: Stack(
        children: [
          Positioned(child: _Shadow(), bottom: 20, right: 0),
          Image(image: AssetImage(shoeModel.assetImage)),
        ],
      ),
    );
  }
}

class _Shadow extends StatelessWidget {
  _Shadow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: [BoxShadow(color: Color(0xffeaa14e), blurRadius: 40)],
        ),
      ),
    );
  }
}
