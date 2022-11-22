import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:github_list/data/other/failure_model.dart';
import 'package:github_list/data/other/view_data_state.dart';
import 'package:github_list/data/response/response.dart';
import 'package:github_list/domain/usecase/user_usecase.dart';
import 'package:github_list/utils/services/shared_pref/shared_pref.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserUseCase useCase;
  final SharedPref sharedPref;

  UserBloc({required this.useCase, required this.sharedPref})
      : super(UserState.initial()) {
    on<GetUserEvent>(_mapGetUserEventToState);
  }

  void _mapGetUserEventToState(
      GetUserEvent event, Emitter<UserState> emit) async {
    try {
      emit(
        state.copyWith(
          statusUser: ViewData.loading(message: 'loading'),
        ),
      );
      final result = await useCase.getUserProcess();

      result.fold(
        (failure) => emit(
          state.copyWith(
            statusUser: ViewData.error(
              failure: FailureModel(
                message: failure.message,
              ),
            ),
          ),
        ),
        (result) async {
          emit(state.copyWith(
            statusUser: ViewData.loaded(data: result),
          ));
        },
      );
    } catch (error) {
      debugPrint("Error get user : $error");
      emit(state.copyWith(
        statusUser: ViewData.error(
          failure: FailureModel(
            message: '$error',
          ),
        ),
      ));
    }
  }
}
