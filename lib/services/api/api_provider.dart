import 'dart:convert';

import 'package:countries_restful/models/country.dart';
import 'package:countries_restful/services/api/base_url.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  http.Client client = http.Client();

  Future<List<Country>> getAllCountries() async {
    final response = await client.get(
      Uri.parse("${ApiConstants.baseUrl}/all?fields=${ApiConstants.fields}"),
    );
    final List<Country> countries = [];

    if (response.statusCode == 200) {
      final mapJs = jsonDecode(response.body) as List<dynamic>;
      for (var element in mapJs) {
        countries.add(Country.fromJson(element));
      }
      return countries;
    } else {
      throw Exception("Coudn't fetch data");
    }
  }
}
