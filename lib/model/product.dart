import 'dart:math';
class Product{
  int id;
  String name;
  double price;
  Product({required this.id,required this.name,required this.price});
  Product getRandom(){
    return Product(id: Random().nextInt(100),name: "mabu",price: (Random().nextInt(10)+10)*1000);
  }
  @override
  List<Object> get props => [id,name,price];
}

class ProductDetail{
  int id;
  int quatity;
  String name;
  double price;
  ProductDetail({required this.id,required this.quatity,required this.name,required this.price});
  ProductDetail fromProduct(Product product){
    return ProductDetail(id: product.id,name: product.name,price: product.price,quatity: 1);
  }
}