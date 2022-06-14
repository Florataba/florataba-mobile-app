part of 'order_bloc.dart';

@immutable
abstract class OrderState {
  const OrderState();
}

class OrderInitial extends OrderState {
  const OrderInitial();
}

class LoadedOrders extends OrderState {
  final List<OrderModel> list;

  const LoadedOrders(this.list);
}
