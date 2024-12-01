part of 'countries_api_bloc.dart';

@immutable
sealed class CountriesApiEvent {
  final String name;
  const CountriesApiEvent({required this.name});
}

final class CountriesApiSearchCountryEvent extends CountriesApiEvent {
  const CountriesApiSearchCountryEvent({required super.name});
}

final class CountriesApiDetailedEvent extends CountriesApiEvent {
  const CountriesApiDetailedEvent({required super.name});
}

final class CountriesApiCustomEvent extends CountriesApiEvent {
  const CountriesApiCustomEvent({required super.name});
}
