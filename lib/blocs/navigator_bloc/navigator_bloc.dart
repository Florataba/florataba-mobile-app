import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
part 'navigator_event.dart';

part 'navigator_state.dart';

class NavigatorBloc extends Bloc<NavigatorEvent, NavigationState> {
  NavigatorBloc()
      : super(const NavigatorInitial(initialIndex: 0)) {

    on<UpdateNavigation>((event, emit) {
      emit(CurrentNavigator(event.value));
    });
  }
}
