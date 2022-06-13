import 'package:florataba_mobile_app/blocs/catalog_bloc/catalog_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogFilterInput extends StatelessWidget {
  const CatalogFilterInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CatalogBloc _catalogBloc = BlocProvider.of<CatalogBloc>(context);

    return Container(
      height: 50,
      margin: const EdgeInsets.only(right: 16, left: 16, top: 12),
      child: TextField(
        textAlign: TextAlign.left,
        textAlignVertical: TextAlignVertical.bottom,
        cursorColor: Colors.grey.shade400,
        decoration: InputDecoration(
            focusColor: Colors.grey.shade400,
            prefixIcon: Icon(
              Icons.search_rounded,
              color: Colors.grey.shade400,
            ),
            hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 18),
            hintText: "Search",
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(16),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(16),
            )),
        onChanged: (value) {
          _catalogBloc.add(UpdateFilterValue(filterValue: value));
          _catalogBloc.add(const UpdateCatalog());
        },
      ),
    );
  }
}
