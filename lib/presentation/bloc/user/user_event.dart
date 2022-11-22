part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class GetUserEvent extends UserEvent {
  GetUserEvent();

  List<Object> get props => [];
}
