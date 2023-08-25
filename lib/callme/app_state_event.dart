part of 'app_state_bloc.dart';

abstract class AppStateEvent extends Equatable {
  const AppStateEvent();
}

class LoadUserEvent extends AppStateEvent {
  @override
  List<Object?> get props => [];
}
