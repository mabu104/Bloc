import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../../model/product.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<LoadProduct>((event, emit) async {
      await Future<void>.delayed(const Duration(seconds: 3));
      emit(const ProductLoaded(gridView: false, products: <Product>[]));
    });

    on<AddProduct>((event, emit) {
      if (state is ProductLoaded) {
        final state = this.state as ProductLoaded;
        emit(
          ProductLoaded(
            gridView: state.gridView,
            products: List.from(state.products)..add(event.product),
          ),
        );
      }
    });
    on<RemoveProduct>((event, emit) {
      if (state is ProductLoaded) {
        final state = this.state as ProductLoaded;
        if (state.products.isNotEmpty) {
          emit(
            ProductLoaded(
              gridView: state.gridView,
              products: List.from(state.products)
                ..removeAt(state.products.length - 1),
            ),
          );
        }
      }
    });

    on<ChangeView>((event, emit) {
      if (state is ProductLoaded) {
        final state = this.state as ProductLoaded;
        emit(
          ProductLoaded(
            gridView: !state.gridView,
            products: state.products,
          ),
        );
      }
    });
  }
}
