import 'package:florataba_mobile_app/blocs/profile_bloc/profile_event.dart';
import 'package:florataba_mobile_app/blocs/profile_bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super();
  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is ChangeAvatarRequest) {
      // show action sheet
    } else if (event is OpenImagePicker) {
      // open image picker
    }  else if (event is ProfileDescriptionChanged) {
      yield state.copyWith(userDescription: event.description, avatarPath: '', userMail: '', );
    } else if (event is SaveProfileChanges) {
      // handle save changes
    }
  }
}