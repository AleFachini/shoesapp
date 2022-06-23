import 'package:flutter/material.dart';
import 'package:shoesapp/src/widgets/widgets_barrel.dart';

class AddToCart extends StatelessWidget {
  final double amount;

  AddToCart({Key? key, required this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.10),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          SizedBox(width: 20),
          Text(
            '\$$amount',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          OvalButton(text: 'Ale'),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}
