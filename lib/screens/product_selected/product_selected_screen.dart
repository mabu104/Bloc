import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_bloc/screens/product_selected/bloc/product_selected_bloc.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
      ),
      body: Center(
        child: BlocBuilder<ProductSelectedBloc, ProductSelectedState>(
          builder: (context, state) {
            if (state is ProductSelected) {
              return Column(
                children: [
                  Text('${state.productDetails.length}'),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: state.productDetails.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${state.productDetails[index].id}'),
                              const SizedBox(width: 10),
                              Text(state.productDetails[index].name),
                              const SizedBox(width: 10),
                              Text('${state.productDetails[index].price}'),
                              const SizedBox(width: 10),
                              Text('${state.productDetails[index].quatity}'),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }

            return const Text("nothing");
          },
        ),
      ),
    );
  }
}
