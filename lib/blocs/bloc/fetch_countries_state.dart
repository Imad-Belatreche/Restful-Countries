part of 'fetch_countries_bloc.dart';

@immutable
sealed class FetchCountriesState {}

final class FetchCountriesInitialState extends FetchCountriesState {}

final class FetchCountriesLoadingState extends FetchCountriesState {}

final class FetchCountriesDoneState extends FetchCountriesState {
  final List<Country> country;

  FetchCountriesDoneState({
    required this.country,
  });
}

final class FetchCountriesErrorState extends FetchCountriesState {
  final String errorMsg;

  FetchCountriesErrorState({
    required this.errorMsg,
  });
}
