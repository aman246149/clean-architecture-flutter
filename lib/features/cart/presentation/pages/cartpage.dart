import 'package:ecommerce/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatelessWidget {
  double price = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is CartErrorState) {
            return Center(child: Text(state.errorMsg));
          }

          if (state is CartLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
       

          if (state is CartSuccessState) {
            return Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  color: Color(0xFFFFD819),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 38.0, top: 40),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Cart",
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Total ${state.cartList.length == 0 ? 0 : price}",
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 25),
                      ),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        color: Colors.black,
                        onPressed: () {
                          Navigator.pushNamed(context, "/checkout");
                        },
                        child: Text(
                          "PLACE ORDER",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: state.cartList.length == 0
                        ? Center(
                            child: Text(
                              "No Element In the Cart",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                          )
                        : ListView.builder(
                            itemCount: state.cartList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(28.0),
                                child: Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 120,
                                            width: 120,
                                            decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                            child: Image.network(
                                              state.cartList[index].imageUrl
                                                  .toString(),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 18.0),
                                            child: Container(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    state.cartList[index].title
                                                        .toString()
                                                        .split(" ")[0],
                                                    style: TextStyle(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      IconButton(
                                                          onPressed: () {},
                                                          icon:
                                                              Icon(Icons.add)),
                                                      Text(
                                                        "QTY : ${2} ",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w800),
                                                      ),
                                                      IconButton(
                                                          onPressed: () {},
                                                          icon: Icon(
                                                              Icons.remove)),
                                                    ],
                                                  ),
                                                  Text(
                                                      "${state.cartList[index].price} Rs",
                                                      style: TextStyle(
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.w800)),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text("30 Days Easy Return",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w600))
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5.0, left: 8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                                onTap: () {
                                                  BlocProvider.of<CartBloc>(
                                                          context)
                                                      .add(DeleteCartEvent(
                                                          index: index));
                                                },
                                                child: Text(
                                                  "Remove",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                )
              ],
            );
          }
          return Container();
        },
      )),
    );
  }
}
