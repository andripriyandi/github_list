import 'dart:io';

import 'package:github_list/utils/constant/api_constant.dart';

class ConfigEnvironment {
  final String baseUrl = ApiConstant.baseUrlDev;

  final headers = {
    HttpHeaders.contentTypeHeader: "application/json",
  };
}
