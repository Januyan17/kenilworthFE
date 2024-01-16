import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CallApi {
  var baseurl = "";

  getData(url) {
    var fullurl = Uri.parse(baseurl + url);
    return http.get(
      fullurl,
    );
  }
}
