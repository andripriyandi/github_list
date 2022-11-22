part of 'user_bloc.dart';

class UserState extends Equatable {
  final ViewData<UserResponse> statusUser;

  const UserState({
    required this.statusUser,
  });

  factory UserState.initial() {
    return UserState(
      statusUser: ViewData.initial(),
    );
  }

  UserState copyWith({
    ViewData<UserResponse>? statusUser,
  }) {
    return UserState(
      statusUser: statusUser ?? this.statusUser,
    );
  }

  @override
  List<Object?> get props => [
        statusUser,
      ];
}
