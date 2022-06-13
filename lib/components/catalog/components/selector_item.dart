import 'package:florataba_mobile_app/blocs/catalog_bloc/catalog_bloc.dart';
import 'package:florataba_mobile_app/blocs/selector_bloc/selector_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectorItem extends StatelessWidget {
  final String title;

  const SelectorItem({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SelectorBloc _bloc = BlocProvider.of<SelectorBloc>(context);
    CatalogBloc _catalogBloc = BlocProvider.of<CatalogBloc>(context);

    return BlocBuilder<SelectorBloc, SelectorState>(
      bloc: _bloc,
      builder: (context, state) {
        return (state is SelectorInitial)
            ? InkWell(
                onTap: () {
                  _bloc.add(SelectItem(title));
                  _catalogBloc.add(UpdateCatalog(selectorValue: title));
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 16),
                  decoration: BoxDecoration(
                      color:
                          (state.value == title) ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          width: 1.5,
                          color: (state.value == title)
                              ? Colors.black
                              : Colors.grey.shade400)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                  height: 45,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      title,
                      style: TextStyle(
                          color: (state.value == title)
                              ? Colors.white
                              : Colors.grey.shade400,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              )
            : const SizedBox();
      },
    );
  }
}
