import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomCard extends StatelessWidget {
  final String productName;
  final double productPrice;
  final String imageurl;
  const CustomCard(
      {Key? key,
      required this.productName,
      required this.productPrice,
      required this.imageurl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: const Color.fromARGB(255, 249, 247, 247),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(imageurl),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(productName),
            const SizedBox(
              height: 5,
            ),
            Text("\$ ${productPrice.toString()}"),
          ],
        ),
      ),
    );
  }
}
