part of 'selector_bloc.dart';

@immutable
abstract class SelectorState {
  const SelectorState();
}

class SelectorInitial extends SelectorState {
  final String value;
  const SelectorInitial(this.value);
}

class SelectedItemState extends SelectorState {
  final String value;

  const SelectedItemState(this.value);
}
