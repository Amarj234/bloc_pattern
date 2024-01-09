import 'package:flutter_bloc/flutter_bloc.dart';

import '../apicall.dart';
import 'app_state2.dart';
import 'app_state_bloc.dart';

class AppsBloc extends Bloc<LoadUserEvent2, UserApp> {
  AppsBloc() : super(InitialState()) {
    UserRepository userRepository = UserRepository();
    on<LoadUserEvent2>((event, emit) async {
      emit(UserloadState());
      try {
        final users = await userRepository.getmydata2();
        print(users);
        emit(UserLoadedState3(users));
      } catch (e) {
        emit(ErroState(error: '$e'));
      }
    });
  }
}
