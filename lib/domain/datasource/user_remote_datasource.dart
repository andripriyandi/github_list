import 'package:dio/dio.dart';
import 'package:github_list/data/other/handle_failure.dart';
import 'package:github_list/data/other/response_object.dart';
import 'package:github_list/data/other/tupple.dart';
import 'package:github_list/data/response/response.dart';
import 'package:github_list/utils/constant/api_constant.dart';

import 'package:github_list/utils/services/config/config_environtment.dart';
import 'package:github_list/utils/services/internal_service/get_data_api.dart';
import 'package:github_list/utils/services/shared_pref/shared_pref.dart';

class UserRemoteDataSource extends ConfigEnvironment with GetDataApi {
  final Dio dio;
  final SharedPref sharedPref;
  UserRemoteDataSource({required this.dio, required this.sharedPref});

  Future<UserResponse> getUserProcess() async {
    Tupple<HandleFailure, ResponseObject> data = await getdataAPIHeadersString(
      baseUrl: baseUrl,
      endPoint: ApiConstant.userUrl,
      nullSafety: "",
      serializer: UserResponse.serializer,
      headers: {},
    );

    UserResponse dataResult = data.onSuccess as UserResponse;

    return dataResult;
  }
}
