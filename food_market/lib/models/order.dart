import 'package:food_market/models/food.dart';

enum OrderStatus { pending, onDelivery, success, cancelled }

class Order {
  final int? id;
  final Food? food;
  final DateTime? orderTime;
  OrderStatus orderStatus;

  Order({
    this.id,
    this.food,
    this.orderTime,
    this.orderStatus = OrderStatus.pending,
  });
}

List<Order> mockOrderList = [];
List<Order> mockPastOrderList = [];
