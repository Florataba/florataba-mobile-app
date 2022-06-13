import 'package:florataba_mobile_app/redux/actions/cart_action.dart';
import 'package:florataba_mobile_app/redux/app_state.dart';

CartState reducer(CartState prevState, dynamic action) {
  CartState newState = CartState.fromAppState(prevState);

  if (action is AddToCart) {
    newState.cartList.add(action.item);
  }
  if (action is RemoveFromCart) {
    newState.cartList.remove(action.item);
  }

  return newState;
}
