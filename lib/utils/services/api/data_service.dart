import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:vaxim/constants/api_path.dart';
import 'package:vaxim/module/model/cat_model.dart';
import 'package:vaxim/module/model/my_order_model.dart';
import 'package:vaxim/module/model/product_model.dart';
import 'package:vaxim/utils/helper/exception.dart';

class DataService {
  DataService._();
  static final DataService _instance = DataService._();
  static DataService get instance => _instance;

  Future<Map<String, dynamic>> getAllProduct() async {
    String url = baseUrl + productUrl;
    Uri uri = Uri.parse(url);
    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        // ignore: avoid_print
        // print(responseData);
        final _list = <ProductModel>[];
        responseData.forEach((e) {
          _list.add(ProductModel.fromJson(e));
        });

        final map = {"code": response.statusCode, "data": _list};
        return map;
      } else {
        final map = {"code": response.statusCode, "data": response.body};
        return map;
      }
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getCategory() async {
    String url = baseUrl + categoryUrl;
    Uri uri = Uri.parse(url);
    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        // ignore: avoid_print
        // print(responseData);
        final _list = <CatModel>[];
        responseData.forEach((e) {
          _list.add(CatModel.fromJson(e));
        });

        final map = {"code": response.statusCode, "data": _list};
        return map;
      } else {
        final map = {"code": response.statusCode, "data": response.body};
        return map;
      }
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<Map<String, dynamic>> orderService({int? id}) async {
    String params = "=$id";
    String url = baseUrl + myOrderPath + params;
    Uri uri = Uri.parse(url);
    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final list = <MyOrderModel>[];
        responseData.map((e) => list.add(MyOrderModel.fromJson(e))).toList();
        final map = {"code": response.statusCode, "data": list};

        return map;
      } else {
        final map = {"code": response.statusCode, "data": response.body};
        return map;
      }
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      rethrow;
    }
  }
}
