import 'dart:convert';
import 'dart:io';

Future<String> httpPost(Uri uri, Object body, String id, Map<String, String> headers) async {
  var client = HttpClient();
  var req = await client.postUrl(uri);
  headers.forEach((key, value) => req.headers.add(key, value));
  req.writeln(body);
  await req.flush();
  var res = await req.close();
  var bytes = await res.toList();
  var actualBytes = <int>[];
  for (var b in bytes) {
    actualBytes.addAll(b);
  }
  client.close();
  String r;
  try {
    String Function(List<int>) charset;
    var cs = res.headers.contentType.charset.toLowerCase();
    if (cs == 'utf-8') {
      charset = utf8.decode;
    } else if (cs == 'us' || cs == 'us-ascii' || cs == 'ascii') {
      charset = ascii.decode;
    } else if (cs == 'latin1' || cs == 'l1') {
      charset = latin1.decode;
    } else {
      charset = utf8.decode;
    }
    r = charset(actualBytes);
  } catch (e) {
    r = String.fromCharCodes(actualBytes);
  }

  return r;
}