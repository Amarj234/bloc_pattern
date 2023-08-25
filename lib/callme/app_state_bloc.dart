import 'package:bloc/bloc.dart';
import 'package:bloc_pattern/callme/Usermodels.dart';
import 'package:equatable/equatable.dart';

import '../apicall.dart';

part 'app_state_event.dart';
part 'app_state_state.dart';

class AppStateBloc extends Bloc<AppStateEvent, AppStateState> {
  final UserRepository _userRepository;
  AppStateBloc(this._userRepository) : super(AppStateInitial()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoadingState2());
      try {
        final users = await _userRepository.getmydata();
        emit(UserLoadedState2(users));
      } catch (e) {
        emit(UserErrorState2(e.toString()));
      }
      // TODO: implement event handler
    });
  }
}
