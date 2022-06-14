import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vaxim/constants/api_path.dart';

class AuthServices {
  AuthServices._();
  static final AuthServices _instance = AuthServices._();
  static AuthServices get instance => _instance;

  /*<---------------------Register Service--------------------->*/

  Future registerFromApi(String username, String email, String pass) async {
    String url = baseUrl + registerPath;
    final payload = {"username": username, "email": email, "password": pass};
    // final header = {"Content-Type": "application/json"};

    try {
      http.Response response = await http.post(Uri.parse(url), body: payload);

      Map<String, dynamic> responseResult = <String, dynamic>{};

      final responseData = jsonDecode(response.body);

      responseResult = {"code": response.statusCode, "data": responseData};

      return responseResult;
    } on Exception catch (e) {
      // ignore: avoid_print
      print(e.toString());
      rethrow;
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      rethrow;
    }
  }

  /*<---------------------Login Service--------------------->*/

  Future loginFromApi(String identifier, String pass) async {
    String url = baseUrl + loginPath;
    final payload = {"identifier": identifier, "password": pass};
    final header = {"Content-Type": "application/json"};
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        body: jsonEncode(payload),
        headers: header,
      );
      Map<String, dynamic> responseResult = <String, dynamic>{};

      final responseData = jsonDecode(response.body);

      responseResult = {"code": response.statusCode, "data": responseData};

      return responseResult;
    } on Exception catch (e) {
      // ignore: avoid_print
      print(e.toString());
      rethrow;
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      rethrow;
    }
  }
}
