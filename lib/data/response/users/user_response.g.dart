part of 'user_response.dart';

UserResponse _$UserResponseFromJson(List<dynamic> json) => UserResponse(
      dataUsers: json
          .map((e) => DataUsers.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
