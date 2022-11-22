import 'package:dio/dio.dart';
import 'package:github_list/di/dependency.dart';
import 'package:github_list/utils/network/api_helper.dart';
import 'package:github_list/utils/network/api_helper_impl.dart';
import 'package:github_list/utils/services/config/config_environtment.dart';
import 'package:github_list/utils/services/config/dio_client.dart';

class NetworkDependency extends ConfigEnvironment {
  NetworkDependency() {
    _registerNetworkLibrary();
    _registerApiHelper();
    _dioClient();
  }
  void _registerNetworkLibrary() => locator.registerLazySingleton<Dio>(
        () => Dio(),
      );

  void _registerApiHelper() => locator.registerLazySingleton<ApiHelper>(
        () => ApiHelperImpl(
          dio: locator(),
        ),
      );

  void _dioClient() =>
      locator.registerLazySingleton(() => DioClient(apiBaseUrl: baseUrl));
}
