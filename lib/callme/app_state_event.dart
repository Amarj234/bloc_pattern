part of 'app_state_bloc.dart';

abstract class AppStateEvent extends Equatable {
  const AppStateEvent();
}

class LoadUserEvent extends AppStateEvent {
  @override
  List<Object?> get props => [];
}

class ChangeUserEvent extends AppStateEvent {
  final num id;
  @override
  ChangeUserEvent({required this.id});
  @override
  List<Object?> get props => [id];
}
