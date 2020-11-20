import 'dart:convert';
import 'package:dsb_api/src/models/exceptions.dart';
import 'package:dsbuntis/dsbuntis.dart' as dsb;
import 'package:dsb_api/src/api/post.dart';

Future<Map> getData(String username, String password) async {
  try {
    var data = await dsb.dsbGetData(username, password, httpPost);
    return jsonDecode(data);
  } catch (e) {
    var err;
    if(e.runtimeType == ''.runtimeType) err = e;
    throw DSBQueryException(error: err);
  }
}

Future<bool> checkCredentials(String username, String password) async {
  try {
    var result = await dsb.dsbCheckCredentials(username, password, httpPost);
    return result == null;
  } catch (e) {
    var err;
    if(e.runtimeType == ''.runtimeType) err = e;
    throw DSBQueryException(error: err);
  }
}