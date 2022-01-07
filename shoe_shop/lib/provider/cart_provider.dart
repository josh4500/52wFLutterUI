import 'package:flutter/cupertino.dart';
import 'package:shoe_shop/model/cart_item.dart';
import 'package:shoe_shop/model/product.dart';

class CartProvider extends ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get itemCount => _items.length;

  int get totalItemCount => _items.fold(
      0, (previousValue, element) => previousValue + element.quantity);

  double get totalAmount =>
      _items.fold(0, (sum, item) => sum + item.price * item.quantity);

  void addItem({Product? product, CartItem? cartItem}) {
    if (cartItem != null) {
      if (_items.any((element) => element.id == cartItem.id)) {
        _items = _items.map((element) {
          if (element.id == cartItem.id) {
            element.quantity += 1;
          }
          return element;
        }).toList();
      }
    } else if (product != null) {
      if (_items.any((element) => element.id == product.id)) {
        _items = _items.map((element) {
          if (element.id == product.id) {
            element.quantity += 1;
          }
          return element;
        }).toList();
      } else {
        _items.add(CartItem(
          id: product.id,
          title: product.name,
          price: product.price,
          quantity: 1,
        ));
      }
    }
    notifyListeners();
  }

  void removeItem(int index) {
    _items[index].quantity -= 1;
    if (_items[index].quantity == 0) {
      _items.removeAt(index);
    }
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

  void removeItemById(int id) {
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }
}
