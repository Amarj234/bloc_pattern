part of 'app_state_bloc.dart';

abstract class AppStateState extends Equatable {
  const AppStateState();
}

class AppStateInitial extends AppStateState {
  @override
  List<Object> get props => [];
}

class UserLoadingState2 extends AppStateState {
  @override
  List<Object?> get props => [];
}

class UserLoadedState2 extends AppStateState {
  Usermodels users;
  UserLoadedState2(this.users);
  @override
  List<Usermodels> get props => [users];
}

class UserErrorState2 extends AppStateState {
  final String error;
  UserErrorState2(this.error);
  @override
  List<Object?> get props => [error];
}
