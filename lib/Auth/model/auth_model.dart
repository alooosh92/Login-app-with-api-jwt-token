import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:login/res/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

String hostting = API.hostting;

class AuthUrl {
  static Uri loginUrl = Uri.parse("$hostting/api/Auth/Login");
  static Uri registerUrl = Uri.parse("$hostting/api/Auth/Register");
  static Uri changePasswordUrl = Uri.parse("$hostting/api/Auth/ChangePassword");
  static String forgetPasswordUrl = "$hostting/api/Auth/ForgetPassword";
  static String refreshTokenUrl = "$hostting/api/Auth/RefreshToken";
  static String revokeTokenUrl = "$hostting/api/Auth/RevokeToken";
  static String checkTokenUrl = "$hostting/api/Auth/CheckToken";
  static Map<String, String> header(String token) => {
        "Accept": "*/*",
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      };
}

class User {
  late String userName;
  late String password;

  User({
    required this.userName,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'password': password,
      };
}

class ChangePassword {
  late String userName;
  late String oldPassword;
  late String newPassword;

  ChangePassword({
    required this.newPassword,
    required this.oldPassword,
    required this.userName,
  });
  Map<String, dynamic> toJson() => {
        'userName': userName,
        'oldPassword': oldPassword,
        'newPassword': newPassword,
      };
}

class AuthModel {
  late String? message;
  late bool? isAuthanticated;
  late String? email;
  late List<dynamic>? roles;
  late String? token;
  late String? refreshToken;
  late DateTime? refreshTokenExpireson;

  AuthModel({
    this.email,
    this.isAuthanticated,
    this.message,
    this.refreshToken,
    this.refreshTokenExpireson,
    this.roles,
    this.token,
  });
  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      email: json['email'],
      isAuthanticated: json['isAuthanticated'],
      message: json['message'],
      refreshToken: json['refreshToken'],
      refreshTokenExpireson: json['refreshTokenExpireson'] != null
          ? DateTime.parse(json['refreshTokenExpireson'])
          : DateTime.now(),
      roles: json['roles'],
      token: json['token'],
    );
  }
}

class AuthController {
  static void _addValue(String? token, String? refreshToken,
      String? refreshTokenExpireson, List<dynamic>? roles) async {
    var shared = await SharedPreferences.getInstance();
    List<String> role = [];
    if (roles != null) {
      for (var ro in roles) {
        role.add(ro.toString());
      }
    }
    shared.setString('token', token.toString());
    shared.setString('refreshToken', refreshToken.toString());
    shared.setString('refreshTokenExpireson', refreshTokenExpireson.toString());
    shared.setStringList('roles', role);
  }

  static Future<AuthModel> login(User user) async {
    var body = jsonEncode(user.toJson());
    http.Response response = await http.post(AuthUrl.loginUrl,
        body: body, headers: AuthUrl.header(""));
    if (response.statusCode == 200) {
      var json = AuthModel.fromJson(jsonDecode(response.body));
      if (json.isAuthanticated!) {
        var authModel = AuthModel(
            email: json.email,
            isAuthanticated: json.isAuthanticated,
            message: json.message,
            refreshToken: json.refreshToken,
            refreshTokenExpireson: json.refreshTokenExpireson,
            roles: json.roles,
            token: json.token);
        _addValue(
          authModel.token,
          authModel.refreshToken,
          authModel.refreshTokenExpireson.toString(),
          authModel.roles,
        );
        return authModel;
      }
    }
    return AuthModel(message: "Error", isAuthanticated: false);
  }

  static Future<AuthModel> register(User user) async {
    var body = jsonEncode(user.toJson());
    http.Response response = await http.post(AuthUrl.registerUrl,
        body: body, headers: AuthUrl.header(""));
    if (response.statusCode == 200) {
      var json = AuthModel.fromJson(jsonDecode(response.body));
      if (json.isAuthanticated!) {
        var authModel = AuthModel(
            email: json.email,
            isAuthanticated: json.isAuthanticated,
            message: json.message,
            refreshToken: json.refreshToken,
            refreshTokenExpireson: json.refreshTokenExpireson,
            roles: json.roles,
            token: json.token);
        _addValue(
          authModel.token,
          authModel.refreshToken,
          authModel.refreshTokenExpireson.toString(),
          authModel.roles,
        );
        return authModel;
      }
    }
    return AuthModel(message: "Error", isAuthanticated: false);
  }

  static Future<AuthModel> changePassword(ChangePassword user) async {
    var body = jsonEncode(user.toJson());
    http.Response response = await http.post(AuthUrl.changePasswordUrl,
        body: body, headers: AuthUrl.header(""));
    if (response.statusCode == 200) {
      var json = AuthModel.fromJson(jsonDecode(response.body));
      var authModel = AuthModel(
          email: json.email,
          isAuthanticated: json.isAuthanticated,
          message: json.message,
          refreshToken: json.refreshToken,
          refreshTokenExpireson: json.refreshTokenExpireson,
          roles: json.roles,
          token: json.token);
      _addValue(
        authModel.token,
        authModel.refreshToken,
        authModel.refreshTokenExpireson.toString(),
        authModel.roles,
      );
      return authModel;
    }
    return AuthModel(message: "Error", isAuthanticated: false);
  }

  static Future<bool> forgetPassword(String email) async {
    Uri uri =
        Uri.parse("${AuthUrl.forgetPasswordUrl.toString()}?username=$email");
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) return true;
    return false;
  }

  static Future<AuthModel> refreshToken(String token) async {
    Uri uri = Uri.parse("${AuthUrl.refreshTokenUrl}?token=$token");
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      var json = AuthModel.fromJson(jsonDecode(response.body));
      var authModel = AuthModel(
          email: json.email,
          isAuthanticated: json.isAuthanticated,
          message: json.message,
          refreshToken: json.refreshToken,
          refreshTokenExpireson: json.refreshTokenExpireson,
          roles: json.roles,
          token: json.token);
      _addValue(
        authModel.token,
        authModel.refreshToken,
        authModel.refreshTokenExpireson.toString(),
        authModel.roles,
      );
      return authModel;
    }
    return AuthModel(
      email: '',
      isAuthanticated: false,
      message: '',
      refreshToken: '',
      refreshTokenExpireson: DateTime.now(),
      roles: [],
      token: '',
    );
  }

  static Future<bool> revokeToken() async {
    var shared = await SharedPreferences.getInstance();
    var token = shared.getString('refreshToken');
    Uri uri = Uri.parse("${AuthUrl.revokeTokenUrl}?token=$token");
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      var shared = await SharedPreferences.getInstance();
      shared.clear();
      return true;
    }
    return false;
  }

  static Future<bool> checkToken() async {
    var shared = await SharedPreferences.getInstance();
    var token = shared.getString('token');
    if (token == "null" || token == null) return false;
    Uri uri = Uri.parse(AuthUrl.checkTokenUrl);
    http.Response response =
        await http.get(uri, headers: AuthUrl.header(token));
    if (response.statusCode == 401) {
      var ref = await refreshToken(shared.getString('refreshToken').toString());
      if (ref.isAuthanticated == false) return false;
    }
    return true;
  }
}
