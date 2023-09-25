import 'dart:convert';

import 'package:covid_exam/covid/model/covid_model.dart';
import 'package:http/http.dart' as http;

class ApiHelper
{
  static final helper = ApiHelper._();
  ApiHelper._();

  Covid model = Covid();
  List<Covid> dataList = <Covid>[];

  String apiLink = 'https://corona.lmao.ninja/v2/countries';

  Future<List<Covid>> getJson()
  async {
    var response = await http.get(Uri.parse(apiLink));
    List json = jsonDecode(response.body);
    dataList = json.map((e) => Covid.fromJson(e)).toList();
    return dataList;
  }
}