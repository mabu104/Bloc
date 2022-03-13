import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_bloc/screens/product_selected/bloc/product_selected_bloc.dart';
import 'package:flutter_test_bloc/screens/product_selected/product_selected_screen.dart';

import '../../model/product.dart';
import 'bloc/product_bloc.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        actions: [
          IconButton(
              onPressed: () {
                context.read<ProductBloc>().add(const ChangeView());
              },
              icon: const Icon(Icons.grid_4x4_outlined)),
          IconButton(
              onPressed: () {
                        Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>const ProductDetailView(
                   
                  ),
                ),
              );
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => ProductDetailView()),
                // );
              },
              icon: const Icon(Icons.arrow_forward_ios)),
        ],
      ),
      body: Center(
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductInitial) {
              return const CircularProgressIndicator();
            }
            if (state is ProductLoaded) {
              if (state.gridView) {
                return Column(
                  children: [
                    Text('${state.products.length}'),
                    const SizedBox(height: 10),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemCount: state.products.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              context.read<ProductSelectedBloc>().add(
                                  AddProductDetail(
                                      product: state.products[index]));
                            },
                            child: Card(
                              color: Colors.amberAccent,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('${state.products[index].id}'),
                                  const SizedBox(width: 10),
                                  Text(state.products[index].name),
                                  const SizedBox(width: 10),
                                  Text('${state.products[index].price}'),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                );
              } else {
                return Column(
                  children: [
                    Text('${state.products.length}'),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: state.products.length,
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${state.products[index].id}'),
                                const SizedBox(width: 10),
                                Text(state.products[index].name),
                                const SizedBox(width: 10),
                                Text('${state.products[index].price}'),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }
            }
            return const Text("nothing");
          },
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "2",
            child: const Icon(Icons.add),
            onPressed: () {
              context.read<ProductBloc>().add(AddProduct(
                  product: Product(
                      id: Random().nextInt(100),
                      name: "mabu",
                      price: (Random().nextInt(10) + 10) * 1000)));
            },
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            heroTag: "1",
            child: const Icon(Icons.remove),
            onPressed: () {
              context.read<ProductBloc>().add(const RemoveProduct());
            },
          ),
        ],
      ),
    );
  }
}
