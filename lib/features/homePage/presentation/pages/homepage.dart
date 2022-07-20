import 'package:ecommerce/core/categories/categories.dart';
import 'package:ecommerce/features/homePage/presentation/bloc/home_bloc.dart';
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
          // TODO: implement listener
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
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1525547719571-a2d4ac8945e2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8bGFwdG9wfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Accessories",
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
                          itemCount: 10,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, crossAxisSpacing: 10),
                          itemBuilder: (context, index) {
                            return const CustomCard();
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
