import 'dart:convert';

import 'package:countries_restful/models/country.dart';
import 'package:countries_restful/services/api/base_url.dart';
import 'package:http/http.dart' as http;

class ApiCalls {
  const ApiCalls();

  Future<List<Country>> getAllCountries(String name) async {
    final client = http.Client();
    final response = await client.get(
        Uri.parse(
            "$baseUrl/all?fields=name,altSpellings,capital,cca3,currencies,continents,timezones,languages,maps,area,flags,population"),
        headers: {
          'Connection': 'Keep-Alive',
        });
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
