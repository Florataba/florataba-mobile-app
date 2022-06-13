import 'package:bloc/bloc.dart';
import 'package:florataba_mobile_app/api/orders/order_api.dart';
import 'package:meta/meta.dart';

part 'order_event.dart';

part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(const OrderInitial()) {
    OrderApi _api = OrderApi();
    on<AddOrder>((event, emit) async {
      print(event.data);
      await _api.createOrder(event.data);
    });
  }
}
