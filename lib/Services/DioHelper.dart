import 'dart:io';

import 'package:budgetmate/main.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';

class DioHelper {
  Dio? dio;

  Future<void> init() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();

    final cookieJar =
        PersistCookieJar(storage: FileStorage('${appDocDir.path}/.cookies/'));

    dio = Dio(BaseOptions(
        baseUrl: "https://j82p739d-5001.euw.devtunnels.ms/api/",
        receiveDataWhenStatusError: true));
    dio!.interceptors.add(CookieManager(cookieJar));
  }

  Future<Response?> login(String username, String password) async {
    try {
      var result = await dio!.post("User/Login",
          data: {"Username": username, "Password": password});
      return result;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<Response?> register(
      String username, String email, String password) async {
    try {
      var result = await dio!.post("User/Register", data: {
        "UserName": username,
        "Email": email,
        "Password": password,
        "ConfirmPassword": password
      });
      return result;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<Response?> getDashboardData() async {
    try {
      var result = await dio!.get("Dashboard");
      return result;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
