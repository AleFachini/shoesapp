import 'package:flutter/material.dart';

class ShoeSizePreview extends StatelessWidget {
  ShoeSizePreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: Container(
        width: double.infinity,
        height: 430,
        decoration: BoxDecoration(
          color: Color(0xffffcf53),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          children: [
            _ShoeWithShadow(),
            _ShoeSizes(),
          ],
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
    return Container(
      alignment: Alignment.center,
      width: 45,
      height: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: []),
      child: Text(
        '${sizeFeet.toString().replaceAll('.0', '')}',
        style: TextStyle(
          color: Color(0xfff1a23a),
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _ShoeWithShadow extends StatelessWidget {
  _ShoeWithShadow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(50),
      child: Stack(
        children: [
          Positioned(child: _Shadow(), bottom: 20, right: 0),
          Image(image: AssetImage('assets/imgs/azul.png')),
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
