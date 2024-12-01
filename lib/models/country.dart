import 'package:countries_restful/models/currency.dart';
import 'package:countries_restful/models/flag.dart';
import 'package:countries_restful/models/name.dart';

class Country {
  final Name name;
  final List<String> altSpellings;
  final List<String> capital;
  final String cca3;
  final List<Currency> currency;
  final List<String> continents;
  final List<String> timeZones;
  final List<String> languages;
  final double area;
  final int population;
  final Flag flag;
  final String location;

  Country({
    required this.name,
    required this.altSpellings,
    required this.location,
    required this.capital,
    required this.cca3,
    required this.currency,
    required this.continents,
    required this.timeZones,
    required this.languages,
    required this.area,
    required this.population,
    required this.flag,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    
    final altSpellings = json["altSpellings"] as List<dynamic>? ?? [];
    final continentsMap = json["continents"] as List<dynamic>? ?? [];
    final capital = json["capital"] as List<dynamic>? ?? [];
    final timeZonesMap = json["timezones"] as List<dynamic>? ?? [];
    final languagesMap = json["languages"] as Map<String, dynamic>? ?? {};
    
    final currenciesMap = json["currencies"] as Map<String, dynamic>? ?? {};
    final currencies = currenciesMap.entries.map(
      (entry) {
        final currencyJson = entry.value as Map<String, dynamic>? ?? {};
        return Currency.fromJson(currencyJson);
      },
    ).toList();




    return Country(
      name: Name.fromJson(json["name"] as Map<String, dynamic>),
      cca3: json["cca3"] as String,
      currency: currencies,
      altSpellings: altSpellings.toList().cast<String>(),
      location: json["maps"]["googleMaps"] as String,
      capital: capital.toList().cast<String>(),
      continents: continentsMap.cast<String>(),
      timeZones: timeZonesMap.cast<String>(),
      languages: languagesMap.values.toList().cast<String>(),
      area: json["area"] as double,
      population: json["population"] as int,
      flag: Flag.fromJson(json["flags"]),
    );
  }
}
