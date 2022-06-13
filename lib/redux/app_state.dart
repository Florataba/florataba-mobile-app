import 'package:florataba_mobile_app/api/catalog/catalog_model.dart';

class CartState {
  late List<BouquetModel> cartList;

  CartState({
    required this.cartList,
  });

  static CartState init = CartState(cartList: []);

  CartState.fromAppState(CartState another) {
    cartList = another.cartList;
  }
}
