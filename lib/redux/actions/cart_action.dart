import 'package:florataba_mobile_app/api/catalog/catalog_model.dart';

class AddToCart {
  final BouquetModel item;

  AddToCart(this.item);
}

class RemoveFromCart {
  final BouquetModel item;

  RemoveFromCart(this.item);
}
