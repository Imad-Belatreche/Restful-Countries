part of 'countries_api_bloc.dart';

@immutable
sealed class CountriesApiState {}

final class CountriesApiInitialState extends CountriesApiState {}

final class CountriesApiLoadingState extends CountriesApiState {}

final class CountriesApiDoneState extends CountriesApiState {
  final List<Country> countries;

  CountriesApiDoneState({
    required this.countries,
  });
}

final class CountriesApiErrorState extends CountriesApiState {
  final String errorMsg;

  CountriesApiErrorState({
    required this.errorMsg,
  });
}
