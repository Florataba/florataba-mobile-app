import 'package:bloc/bloc.dart';
import 'package:florataba_mobile_app/api/catalog/catalog_api.dart';
import 'package:florataba_mobile_app/api/catalog/catalog_model.dart';
import 'package:meta/meta.dart';

part 'catalog_event.dart';

part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc() : super(const CatalogInitial()) {
    late List<BouquetModel> _catalogList;
    String _filterValue = '';
    String _selectorValue = 'All';
    CatalogApi _api = CatalogApi();
    on<LoadCatalog>((event, emit) async {
      _catalogList = await _api.getCatalogList();
      emit(CatalogLoaded(_catalogList));
    });
    on<UpdateCatalog>((event, emit) async {
      List<BouquetModel> filtered = _catalogList;

      if (_selectorValue != event.selectorValue) {
        _selectorValue = event.selectorValue;
      }
      if (event.selectorValue != "All") {
        filtered = _catalogList
            .where((element) => element.eventType == _selectorValue)
            .toList();
      }

      emit(CatalogLoaded(filtered
          .where((element) =>
              element.title.toLowerCase().contains(_filterValue.toLowerCase()))
          .toList()));
    });
    on<UpdateFilterValue>((event, emit) async {
      _filterValue = event.filterValue;
    });
  }
}
