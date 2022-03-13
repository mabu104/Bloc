part of 'product_selected_bloc.dart';

abstract class ProductSelectedState extends Equatable {
  const ProductSelectedState();

  @override
  List<Object> get props => [];
}

class ProductSelectedInitial extends ProductSelectedState {}

class ProductSelected extends ProductSelectedState {
  final List<ProductDetail> productDetails;
  const ProductSelected({required this.productDetails});
  @override
  List<Object> get props => [productDetails];
}
