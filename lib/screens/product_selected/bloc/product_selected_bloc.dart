import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../model/product.dart';

part 'product_selected_event.dart';
part 'product_selected_state.dart';

class ProductSelectedBloc
    extends Bloc<ProductSelectedEvent, ProductSelectedState> {
  ProductSelectedBloc() : super(const ProductSelected(productDetails: <ProductDetail>[])) {
    on<ProductSelectedEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<IncrementQuatity>((event, emit) {
      final state = this.state as ProductSelected;
      state.productDetails[event.index].quatity++;
      emit(
        ProductSelected(
          productDetails: state.productDetails,
        ),
      );
    });
    on<DecrementQuatity>((event, emit) {
      final state = this.state as ProductSelected;
      if (state.productDetails[event.index].quatity > 1) {
        state.productDetails[event.index].quatity--;
        emit(
          ProductSelected(
            productDetails: state.productDetails,
          ),
        );
      }
    });
    on<AddProductDetail>((event, emit) {
      final state = this.state as ProductSelected;
      int id = checkProductInList(event.product, state.productDetails);
      if (id == -1) {
        ProductDetail productDetail = ProductDetail(
            id: event.product.id,
            name: event.product.name,
            price: event.product.price,
            quatity: 1);
        emit(
          ProductSelected(
            productDetails: List.from(state.productDetails)..add(productDetail),
          ),
        );
      } else {
        state.productDetails[id].quatity++;
        emit(
          ProductSelected(
            productDetails: state.productDetails,
          ),
        );
      }
    });
  }
}

int checkProductInList(Product product, List<ProductDetail> list) {
  for (int i = 0; i < list.length; i++) {
    if (product.id == list[i].id) {
      return i;
    }
  }
  return -1;
}
