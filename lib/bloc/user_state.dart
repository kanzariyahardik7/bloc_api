import 'package:bloc_api/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserLoadingState extends UserState {
  @override
  List<Object?> get props => [];
}

class UserLoadedState extends UserState {
  List<UserDataModel> userData;
  UserLoadedState(this.userData);
  @override
  List<Object?> get props => [];
}

class UserErrorState extends UserState {
  @override
  List<Object?> get props => [];
}
