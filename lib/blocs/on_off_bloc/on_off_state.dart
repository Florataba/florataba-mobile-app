part of 'on_off_bloc.dart';

@immutable
abstract class OnOffState {
  const OnOffState();
}

class OnOffInitial extends OnOffState {
  final bool state;

  const OnOffInitial(this.state);
}
