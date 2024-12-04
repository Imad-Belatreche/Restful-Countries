part of 'countries_api_bloc.dart';

@immutable
sealed class CountriesApiEvent {
  final String name;
  final Future<List<Country>> allCountries;
  const CountriesApiEvent({
    required this.name,
    required this.allCountries,
  });
}

final class CountriesApiSearchCountryEvent extends CountriesApiEvent {
  const CountriesApiSearchCountryEvent({
    required super.name,
    required super.allCountries,
  });
}

final class CountriesApiDetailedEvent extends CountriesApiEvent {
  const CountriesApiDetailedEvent({
    required super.name,
    required super.allCountries,
  });
}

final class CountriesApiCustomEvent extends CountriesApiEvent {
  const CountriesApiCustomEvent({
    required super.name,
    required super.allCountries,
  });
}
