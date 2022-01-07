import 'package:flutter/cupertino.dart';
import 'package:shoe_shop/model/cart_item.dart';
import 'package:shoe_shop/model/product.dart';

class CartProvider extends ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get itemCount => _items.length;

  double get totalAmount =>
      _items.fold(0, (sum, item) => sum + item.price * item.quantity);

  void addItem(Product product) {
    _items.add(CartItem(
      id: product.id,
      title: product.name,
      price: product.price,
      quantity: 1,
    ));
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void removeSingleItem(Product product) {
    _items.removeWhere((item) => item.id == product.id);
    notifyListeners();
  }

  void clear() {
    _items = [];
    notifyListeners();
  }

  void removeItemById(String id) {
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }
}
