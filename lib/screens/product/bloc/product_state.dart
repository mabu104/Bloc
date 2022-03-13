part of 'product_bloc.dart';
//import 'package:equatable/equatable.dart';

@immutable
class ProductState extends Equatable {
  const ProductState();
  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> products;
  final bool gridView;
  const ProductLoaded({required this.gridView, required this.products});
  @override
  List<Object> get props => [products, gridView];
}
