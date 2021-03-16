import 'dart:convert';

import 'package:dsb_api/src/models/exceptions.dart';
import 'package:http/http.dart' as http;

class API {

  final String _endpoint = 'mobileapi.dsbcontrol.de';
  final String _bundleID = 'de.heinekingmedia.dsbmobile';
  final String _appVersion = '36';
  final String _osVersion = '30';

  String username;
  String password;
  String token;

  API(this.username, this.password);

  Future<String> getAuthToken() async {
    try {
      var uri = Uri.https(_endpoint, '/authid', {
      'user':         username,
      'password':     password,
      'pushid':       null,
      'appversion':   _appVersion,
      'osversion':    _osVersion,
      'bundleid':     _bundleID
      });
      var res = await http.get(uri);
      var body = res.body.trim().replaceAll('"', '');
      if (res.statusCode != 200 || body == '') return null;
      return body;
    } catch (e) {
      String err;
      if (err.runtimeType == ''.runtimeType) err = e;
      throw DSBQueryException(error: err);
    }
  }

  Future<List> getTimetables() async {
    try {
      token ??= await getAuthToken();
      if (token == null) return null;

      var uri = Uri.https(_endpoint, '/dsbtimetables', { 'authid': token });
      var res = await http.get(uri);
      if (res.statusCode != 200) return null;
      return jsonDecode(res.body);
    } catch (e) {
      String err;
      if (err.runtimeType == ''.runtimeType) err = e;
      throw DSBQueryException(error: err);
    }
  }

  Future<List> getDocuments() async {
    try {
      token ??= await getAuthToken();
      if (token == null) return null;

      var uri = Uri.https(_endpoint, '/dsbdocuments', { 'authid': token });
      var res = await http.get(uri);
      if (res.statusCode != 200) return null;
      return jsonDecode(res.body);
    } catch (e) {
      String err;
      if (err.runtimeType == ''.runtimeType) err = e;
      throw DSBQueryException(error: err);
    }
  }

  Future<List> getNews() async {
    try {
      token ??= await getAuthToken();
      if (token == null) return null;

      var uri = Uri.https(_endpoint, '/newstab', { 'authid': token });
      var res = await http.get(uri);
      if (res.statusCode != 200) return null;
      return jsonDecode(res.body);
    } catch (e) {
      String err;
      if (err.runtimeType == ''.runtimeType) err = e;
      throw DSBQueryException(error: err);
    }
  }

}