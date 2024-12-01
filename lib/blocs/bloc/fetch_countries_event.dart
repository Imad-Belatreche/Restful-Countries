part of 'fetch_countries_bloc.dart';

@immutable
sealed class FetchCountriesEvent {
  final String name;
  const FetchCountriesEvent({required this.name});
}

final class FetchCountriesBasicEvent extends FetchCountriesEvent {
  
  const FetchCountriesBasicEvent({required super.name});
}

final class FetchCountriesDetailedEvent extends FetchCountriesEvent {
  const FetchCountriesDetailedEvent({required super.name});
}

final class FetchCountriesCustomEvent extends FetchCountriesEvent {
  const FetchCountriesCustomEvent({required super.name});
}
