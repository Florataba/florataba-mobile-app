part of 'selector_bloc.dart';

@immutable
abstract class SelectorEvent {
  const SelectorEvent();
}
class SelectItem extends SelectorEvent{
  final String value;
  const SelectItem(this.value);
}