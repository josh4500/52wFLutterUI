import 'package:flutter/widgets.dart';
import 'package:shoe_shop/model/product.dart';

class LikedProvider extends ChangeNotifier {
  final List<int> _liked = [];

  List<int> get liked => _liked;

  void addLiked(int id) {
    _liked.add(id);
    notifyListeners();
  }

  void toggleLiked(Product product) {
    isLiked(product.id) ? removeLiked(product.id) : addLiked(product.id);
    notifyListeners();
  }

  void removeLiked(int id) {
    _liked.remove(id);
    notifyListeners();
  }

  bool isLiked(int id) {
    return _liked.contains(id);
  }
}
