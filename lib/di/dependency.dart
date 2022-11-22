import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:github_list/domain/di/user_dependency.dart';
import 'package:github_list/utils/network/network_dependency.dart';
import 'package:github_list/utils/services/shared_pref/shared_pref_dependency.dart';

final locator = GetIt.instance;

class Dependency {
  void initDependency() {
    _registerDomainUser();
    _registerSharedLibrary();
  }

  // Domain
  void _registerDomainUser() => UserDependency();

  void _registerSharedLibrary() {
    NetworkDependency();
    SharedPrefDependency();
  }
}
