import 'package:bloc_api/bloc/user_event.dart';
import 'package:bloc_api/bloc/user_state.dart';
import 'package:bloc_api/repo/user_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepo userRepo;
  UserBloc(this.userRepo) : super(UserLoadingState());

  getProductList() {
    on<UserLoadEvent>((event, state) async {
      emit(UserLoadingState());
      try {
        await userRepo.getUser().then((value) {
          emit(UserLoadedState(value.data ?? []));
        });
      } catch (e) {}
    });
  }
}
