part of 'order_bloc.dart';

@immutable
abstract class OrderEvent {
  const OrderEvent();
}

class AddOrder extends OrderEvent {
  final Map<String, String> data;

  const AddOrder(this.data);
}

class LoadOrders extends OrderEvent {
  const LoadOrders();
}
