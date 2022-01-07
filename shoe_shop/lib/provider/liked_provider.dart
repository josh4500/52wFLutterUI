import 'package:flutter/widgets.dart';

class LikedProvider extends ChangeNotifier {
  final List<String> _liked = [];

  List<String> get liked => _liked;

  void addLiked(String id) {
    _liked.add(id);
    notifyListeners();
  }

  void removeLiked(String id) {
    _liked.remove(id);
    notifyListeners();
  }

  bool isLiked(String id) {
    return _liked.contains(id);
  }
}
