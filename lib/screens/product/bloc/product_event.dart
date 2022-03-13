part of 'product_bloc.dart';

@immutable
 class ProductEvent extends Equatable {
  const ProductEvent();
  @override
  List<Object> get props => [];
}

class LoadProduct extends ProductEvent {}

class AddProduct extends ProductEvent {
  final Product product;
  const AddProduct({required this.product});
  @override
  List<Object> get props => [product];
}

class RemoveProduct extends ProductEvent {
  const RemoveProduct();
}

class ChangeView extends ProductEvent {
  const ChangeView();
}
