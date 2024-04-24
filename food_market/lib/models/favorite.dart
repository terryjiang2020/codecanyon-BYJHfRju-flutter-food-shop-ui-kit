import 'package:food_market/models/food.dart';

class Favorite {
  final int? id;
  final Food? food;
  bool isLiked;

  Favorite({this.id, this.food, this.isLiked = false});
}

List<Favorite> mockFavoriteList = [];
