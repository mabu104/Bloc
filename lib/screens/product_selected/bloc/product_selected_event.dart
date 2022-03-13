part of 'product_selected_bloc.dart';

abstract class ProductSelectedEvent extends Equatable {
  const ProductSelectedEvent();

  @override
  List<Object> get props => [];
}

class LoadProductDetail extends ProductSelectedEvent {}

class IncrementQuatity extends ProductSelectedEvent {
  final int index;
  const IncrementQuatity({required this.index});
  @override
  List<Object> get props => [index];
}

class DecrementQuatity extends ProductSelectedEvent {
  final int index;
  const DecrementQuatity({required this.index});
  @override
  List<Object> get props => [index];
}

class AddProductDetail extends ProductSelectedEvent{
  final Product product;
  const AddProductDetail({required this.product});
   @override
  List<Object> get props => [product];
}
