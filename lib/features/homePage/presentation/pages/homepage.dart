import 'package:ecommerce/core/categories/categories.dart';
import 'package:ecommerce/features/homePage/presentation/bloc/home_bloc.dart';
import 'package:ecommerce/features/homePage/presentation/pages/details_product.dart';
import 'package:ecommerce/features/homePage/presentation/widgets/customcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/mediaqueries/mediaqueries.dart';

class HomePageq extends StatefulWidget {
  const HomePageq({Key? key}) : super(key: key);

  @override
  State<HomePageq> createState() => _HomePageqState();
}

class _HomePageqState extends State<HomePageq> {
  PageController controller = PageController();
  int pagevalue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          print(state);
        },
        builder: (context, state) {
          if (state is HomeErrorState) {
            return Center(
              child: Text(state.error),
            );
          }

          if (state is HomeLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is HomeSuccessState) {
            return Column(
              children: [
                Container(
                  height: getsize(context).height / 3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(state.products[0].productImageUrl),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  categories[pagevalue],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                ),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: InkWell(
                              onTap: () {
                                pagevalue = index;
                                BlocProvider.of<HomeBloc>(context)
                                    .add(ChangeState(index));
                                controller.animateToPage(index,
                                    curve: Curves.decelerate,
                                    duration:
                                        const Duration(milliseconds: 300));
                              },
                              child: Text(
                                categories[index],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                            ));
                      }),
                ),
                Expanded(
                  child: PageView.builder(
                    pageSnapping: true,
                    controller: controller,
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return GridView.builder(
                          itemCount: state.products.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, crossAxisSpacing: 10),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProductDetails(
                                                productPrice: state
                                                    .products[index]
                                                    .productPrice,
                                                productName: state
                                                    .products[index]
                                                    .productName,
                                                productImageUrl: state
                                                    .products[index]
                                                    .productImageUrl,
                                                productDescription:
                                                    state.products[index].productDescription,
                                                category: categories[index],
                                                productId: state.products[index].productId,
                                              )));
                                },
                                child: CustomCard(
                                  productName:
                                      state.products[index].productName,
                                  productPrice:
                                      state.products[index].productPrice,
                                  imageurl:
                                      state.products[index].productImageUrl,
                                ));
                          });
                    },
                  ),
                )
              ],
            );
          }

          return Container();
        },
      ),
    );
  }
}
