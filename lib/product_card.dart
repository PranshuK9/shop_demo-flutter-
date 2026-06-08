import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final Color bgcolor;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.bgcolor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: bgcolor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title , style: Theme.of(context).textTheme.titleMedium,),
          SizedBox(height: 5),
          Text('\$$price'),
          SizedBox(height: 5,),
          Center(
          child: Image(
            image: AssetImage(image),
            height: 175,
          ),
          ),
        ],
      ),
      ),
    );
  }
}
