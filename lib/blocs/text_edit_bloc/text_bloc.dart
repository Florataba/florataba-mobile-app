import 'package:flutter_bloc/flutter_bloc.dart';

class TextInputState {}

class TextInputInitState extends TextInputState {
  String text;
  TextInputInitState({required this.text});
}

class TextInputDataChange extends TextInputState {
  String text;
  TextInputDataChange({required this.text});
}

class TextEvents {}

class TextInit extends TextEvents {}

class TextChange extends TextEvents {
  final String data;
  TextChange({required this.data});
}

class TextUpdateBloc extends Bloc<TextEvents, TextInputState> {
  TextUpdateBloc() : super(TextInputState());

  @override
  get initialState => TextInputInitState(text: "");

  @override
  Stream<TextInputState> mapEventToState(event) async* {
    if (event is TextInit) {
      yield TextInputInitState(text: "");
    } else if (event is TextChange) {
      yield TextInputInitState(text: event.data);
    }
  }
}