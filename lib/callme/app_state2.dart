import 'package:bloc_pattern/callme/product_model.dart';

abstract class UserApp {}

class InitialState extends UserApp {}

class UserloadState extends UserApp {
  List<Object?> get Props => [];
}

class UserLoadedState3 extends UserApp {
  final List<ProductModel> userval;

  UserLoadedState3(this.userval);

  List<Object?> get Props => [userval];
}

class ErroState extends UserApp {
  final String error;

  ErroState({required this.error});
  List<Object?> get Props => [error];
}
