part of 'navigator_bloc.dart';

@immutable
abstract class NavigatorEvent {
  const NavigatorEvent();
}

class UpdateNavigation extends NavigatorEvent {
  final int value;

  const UpdateNavigation(this.value);
}
