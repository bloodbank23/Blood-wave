import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class WebClient {
  // static const baseUrl = "http://192.168.54.155:5200";
/////
  static const baseUrl = "https://api.gtschooloflogistics.com";

  static const imageUrl = "http://apicerp.leopardtechlabs.in/file/get/";

  static Future<dynamic> post(url, data) async {
    var token;
    Map? sendData = {};
    if (data?.isNotEmpty ?? false) {
      sendData.addAll(data);
    }

    var body = json.encode(sendData);
    var response = await http.post(
      Uri.parse(baseUrl + url),
      headers: {"Content-Type": "application/json", "token": token ?? ""},
      body: body,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      var error = {
        "status": false,
        "msg": "Invalid Request",
      };
      return error;
    }
  }

  static Future<dynamic> get(url) async {
    var token;

    var response = await http.get(Uri.parse(baseUrl + url),
        headers: {"Content-Type": "application/json", "token": token ?? ""});

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      var error = {
        "status": false,
        "msg": "Invalid Request",
      };
      return error;
    }
  }

  static Future<dynamic> files(String url, String image, String id) async {
    var request = http.MultipartRequest('POST', Uri.parse(baseUrl + url));
    var token;
    request.headers.addAll(
        {'Content-Type': 'application/form-data', 'token': token ?? ""});
    if (image.isNotEmpty) {
      request.files.add(http.MultipartFile.fromBytes(
          'photo', File(image).readAsBytesSync(),
          filename: image.split('/').last));

      request.fields['id'] = id;
    }
    try {
      http.Response response =
          await http.Response.fromStream(await request.send());
      if (json.decode(response.body)['status']) {
        return jsonDecode(response.body);
      }
      // ignore: empty_catches
    } catch (e) {}
  }

  static Future<dynamic> videoupload(
      String url, String rescueVideo, String id) async {
    var request = http.MultipartRequest('POST', Uri.parse(baseUrl + url));
    String token;

    request.headers
        .addAll({'Content-Type': 'application/form-data', 'token': ""});
    if (rescueVideo.isNotEmpty) {
      request.files.add(http.MultipartFile.fromBytes(
          'rescueVideo', File(rescueVideo).readAsBytesSync(),
          filename: rescueVideo.split('/').last));

      request.fields['id'] = id;
    }
    try {
      http.Response response =
          await http.Response.fromStream(await request.send());
      if (json.decode(response.body)['status']) {
        return jsonDecode(response.body);
      }
      // ignore: empty_catches
    } catch (e) {}
  }
}
