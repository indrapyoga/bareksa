import 'dart:convert';

import 'package:bareksa/app/modules/main_menu/models/Artikel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CallApi {
  static Future<Artikel> getArtikel() async {
    String url = 'https://newsapi.org/v2/';
    String apiKey = 'cc84a03fa2ac4931a8fdb42150afcdef';
    var res = await http.get(Uri.parse(
        "${url}top-headlines?category=business&country=id&apiKey=$apiKey"));
    try {
      if (res.statusCode == 200) {
        return Artikel.fromJson(jsonDecode(res.body));
      } else {
        return Artikel.fromJson(jsonDecode(res.body));
      }
    } catch (e) {
      throw (e);
    }
  }
}
