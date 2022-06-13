import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'selector_event.dart';

part 'selector_state.dart';

class SelectorBloc extends Bloc<SelectorEvent, SelectorState> {
  SelectorBloc() : super(const SelectorInitial("All")) {
    on<SelectItem>((event, emit) {
      emit(SelectorInitial(event.value));
    });
  }
}
