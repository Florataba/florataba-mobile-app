part of 'catalog_bloc.dart';

@immutable
abstract class CatalogState {
  const CatalogState();
}

class CatalogInitial extends CatalogState {
  const CatalogInitial();
}

class CatalogLoaded extends CatalogState {
  final List<BouquetModel> dataList;

  const CatalogLoaded(this.dataList);
}
