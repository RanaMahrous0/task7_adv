import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task7_adv/models/users.dart';
import 'package:task7_adv/repoistory/user_repoistory.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepoistory _userRepoistory;
  UserBloc(this._userRepoistory) : super(UserLoadingState()) {
    on<LoadUserEvent>(onLoadUsers);
  }

  FutureOr<void> onLoadUsers(
      LoadUserEvent event, Emitter<UserState> emit) async {
    emit(UserLoadingState());
    await _userRepoistory.getUsers().then((users) {
      emit(UserLoadedState(users));
    }).catchError((error) {
      emit(UserErrorState(error.toString()));
    });
  }
}
