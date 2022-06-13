part of 'navigator_bloc.dart';

@immutable
abstract class NavigationState {
  const NavigationState();
}

class NavigatorInitial extends NavigationState {
  final String initialRoute;
  final int initialIndex;

  const NavigatorInitial(
      {required this.initialRoute, required this.initialIndex});
}

class CurrentNavigator extends NavigationState {
  final int currentIndex;
  final String navigationRoute;

  const CurrentNavigator(this.currentIndex, this.navigationRoute);
}
