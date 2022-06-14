import 'dart:math';

import 'package:florataba_mobile_app/blocs/catalog_bloc/catalog_bloc.dart';
import 'package:florataba_mobile_app/blocs/login_bloc/login_bloc.dart';
import 'package:florataba_mobile_app/components/catalog/components/catalog_filter_input.dart';
import 'package:florataba_mobile_app/components/catalog/components/catalog_item.dart';
import 'package:florataba_mobile_app/components/catalog/components/custom_selector.dart';
import 'package:florataba_mobile_app/components/navigation/bottom_navigation.dart';
import 'package:florataba_mobile_app/redux/actions/cart_action.dart';
import 'package:florataba_mobile_app/redux/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:redux/redux.dart';

class CatalogView extends StatelessWidget {
  const CatalogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginBloc _loginBloc = BlocProvider.of<LoginBloc>(context);
    CatalogBloc _catalogBloc = BlocProvider.of<CatalogBloc>(context);
    Store<CartState> store = StoreProvider.of<CartState>(context);
    List<Color> colorList = [
      Colors.blue.shade100,
      Colors.red.shade100,
      Colors.yellow.shade100,
      Colors.purple.shade100,
      Colors.deepOrange.shade100
    ];
    return StoreConnector<CartState, CartState>(
      converter: (store) => store.state,
      builder: (context, state) {
        return BlocListener<LoginBloc, LoginState>(
            bloc: _loginBloc,
            listener: (context, state) {
              if (state is SuccessLogoutUser) {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil("/login", (route) => false);
              }
            },
            child: BlocBuilder<CatalogBloc, CatalogState>(
              bloc: _catalogBloc,
              builder: (context, catalogsState) {
                return Scaffold(
                    bottomNavigationBar: const BottomNavigation(),
                    appBar: AppBar(
                        backgroundColor: Colors.white,
                        automaticallyImplyLeading: false,
                        elevation: 0.0,
                        title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Florataba',
                                  style: TextStyle(color: Colors.black)),
                            ])),
                    body: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          const CatalogFilterInput(),
                          const CustomSelector(selectorTitle: [
                            "All",
                            "Single",
                            "Wedding",
                            "Birthday",
                            "Valentine's Day",
                            "Funeral"
                          ]),
                          Expanded(
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: (catalogsState is CatalogLoaded)
                                    ? MasonryGridView.count(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 8,
                                        crossAxisSpacing: 8,
                                        itemCount:
                                            catalogsState.dataList.length,
                                        itemBuilder:
                                            <BuildContext, int>(context,
                                                index) {
                                          return InkWell(
                                            onTap: () => store.dispatch(
                                                AddToCart(catalogsState
                                                    .dataList[index])),
                                            child: CatalogItem(
                                                index: index,
                                                backgroundColor: colorList[
                                                    colorList.length -
                                                        1 -
                                                        Random().nextInt(
                                                            colorList.length)],
                                                data: catalogsState
                                                    .dataList[index],
                                                extent: (index.isEven
                                                        ? 0.35
                                                        : 0.45) *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height),
                                          );
                                        })
                                    : const SizedBox()),
                          ),
                        ],
                      ),
                    ));
              },
            ));
      },
    );
  }
}
