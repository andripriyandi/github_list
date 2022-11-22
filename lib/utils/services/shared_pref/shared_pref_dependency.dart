import 'package:github_list/di/dependency.dart';
import 'package:github_list/utils/services/shared_pref/shared_pref.dart';
import 'package:github_list/utils/services/shared_pref/shared_pref_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefDependency {
  SharedPrefDependency() {
    _registerSharedPreferences();
    _registerSharedPref();
    // _sharedPref();
  }
  void _registerSharedPreferences() async {
    final preferences = await SharedPreferences.getInstance();
    locator.registerLazySingleton<SharedPreferences>(() => preferences);
  }

  void _registerSharedPref() => locator.registerLazySingleton<SharedPref>(
      () => SharedPrefImpl(preferences: locator()));

  // void _sharedPref() => locator
  //     .registerLazySingleton(() => SharedPrefImpl(preferences: locator()));
}