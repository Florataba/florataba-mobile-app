part of 'order_bloc.dart';

@immutable
abstract class OrderState {
  const OrderState();
}

class OrderInitial extends OrderState {
  const OrderInitial();
}
