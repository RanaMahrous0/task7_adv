part of 'user_bloc.dart';

@immutable
sealed class UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  final List<Users> users;
  UserLoadedState(this.users);
}

class UserErrorState extends UserState {
  final String errorMessage;
  UserErrorState(this.errorMessage);
}
