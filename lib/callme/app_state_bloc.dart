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

    on<ChangeUserEvent>((event, emit) {
      print(event.id);
      List<Usermodels>? val;
      AppStateState userList = state;
      // emit(UserLoadingState2());
      if (state is UserLoadedState2) {
        print("List<Object?> ${userList.props}");
        val = userList.props as List<Usermodels>;
        int index = val[0].users!.indexWhere((element) => element.id == event.id);
        val[0].users![index].isred = !val[0].users![index].isred;
        print("List<Object?> ${val[0].users![index].email}");
        emit(AppStateInitial());
        emit(UserLoadedState2(val[0]));
      }
    });
  }
}
