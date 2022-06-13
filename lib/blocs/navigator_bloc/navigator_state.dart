part of 'navigator_bloc.dart';

@immutable
abstract class NavigationState {
  const NavigationState();
}

class NavigatorInitial extends NavigationState {

  final int initialIndex;

  const NavigatorInitial(
      { required this.initialIndex});
}

class CurrentNavigator extends NavigationState {
  final int currentIndex;


  const CurrentNavigator(this.currentIndex);
}
