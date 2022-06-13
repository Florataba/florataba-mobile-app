part of 'catalog_bloc.dart';

@immutable
abstract class CatalogEvent {
  const CatalogEvent();
}

class LoadCatalog extends CatalogEvent {
  const LoadCatalog();
}

class UpdateCatalog extends CatalogEvent {
  final String selectorValue;

  const UpdateCatalog({this.selectorValue = "All"});
}

class UpdateFilterValue extends CatalogEvent {
  final String filterValue;

  const UpdateFilterValue({this.filterValue = ""});
}
