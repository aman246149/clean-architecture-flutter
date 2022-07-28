import 'package:ecommerce/core/mediaqueries/mediaqueries.dart';
import 'package:ecommerce/features/cart/domain/entity/cart_model.dart';

import 'package:ecommerce/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:ecommerce/features/cart/presentation/pages/cartpage.dart';
import 'package:ecommerce/features/homePage/presentation/widgets/circularcolor.dart';
import 'package:ecommerce/features/homePage/presentation/widgets/ratingstar.dart';
import 'package:ecommerce/features/homePage/presentation/widgets/sizecontainer.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetails extends StatelessWidget {
  final String productDescription;
  final double productPrice;
  final String productName;
  final String productImageUrl;
  final String category;
  final String productId;

  const ProductDetails({
    super.key,
    required this.productDescription,
    required this.productPrice,
    required this.productName,
    required this.productImageUrl,
    required this.category,
    required this.productId,
  });
  @override
  Widget build(BuildContext context) {
    print(productName);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.loose,
          children: [
            Container(
                height: MediaQuery.of(context).size.height / 2.5,
                color: Colors.yellow,
                child: Center(
                  child: Image.network(
                    productImageUrl,
                    fit: BoxFit.cover,
                  ),
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 500,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              productName,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w800),
                            ),
                          ),
                          RawMaterialButton(
                            onPressed: () {},
                            elevation: 2.0,
                            fillColor: Colors.white,
                            child: Icon(
                              Icons.favorite,
                              size: 35.0,
                              color: Colors.orange,
                            ),
                            padding: EdgeInsets.all(15.0),
                            shape: CircleBorder(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Price : ${productPrice.toString()} Rs",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Product Description",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        productDescription,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RaisedButton(
                        onPressed: () {
                          CartModel data = CartModel(
                              title: productName,
                              category: "electronics",
                              description: productDescription,
                              imageUrl: productImageUrl,
                              price: productPrice,
                              productId: "123");
                          print(data.title);
                          BlocProvider.of<CartBloc>(context)
                              .add(AddCartEvent(data: data));

                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Cart()));
                        },
                        child: Text(
                          "ADD TO CART",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
