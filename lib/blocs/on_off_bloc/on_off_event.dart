part of 'on_off_bloc.dart';

@immutable
abstract class OnOffEvent {
  const OnOffEvent();
}

class OnOffAction extends OnOffEvent {
  final bool currentState;

  const OnOffAction(this.currentState);
}
