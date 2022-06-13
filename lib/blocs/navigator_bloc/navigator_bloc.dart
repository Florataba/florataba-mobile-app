import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navigator_event.dart';

part 'navigator_state.dart';

class NavigatorBloc extends Bloc<NavigatorEvent, NavigationState> {
  NavigatorBloc()
      : super(const NavigatorInitial(initialIndex: 0, initialRoute: "/home")) {
    String _navigateDirection = "/home";
    on<UpdateNavigation>((event, emit) {
      switch (event.value) {
        case 0:
          _navigateDirection = '/list';
          break;

        case 1:
          _navigateDirection = '/favorite';
          break;

        case 2:
          _navigateDirection = '/notification';
          break;

        case 3:
          _navigateDirection = '/statistic';
          break;
      }
      emit(CurrentNavigator(event.value, _navigateDirection));
    });
  }
}
