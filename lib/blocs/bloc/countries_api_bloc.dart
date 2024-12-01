import 'dart:developer';
import 'package:countries_restful/models/country.dart';
import 'package:countries_restful/services/api/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'countries_api_event.dart';
part 'countries_api_state.dart';

class CountriesApiBloc extends Bloc<CountriesApiEvent, CountriesApiState> {
  CountriesApiBloc() : super(CountriesApiInitialState()) {
    on<CountriesApiSearchCountryEvent>((event, emit) async {
      emit(CountriesApiLoadingState());
      try {
        final allCountries = await ApiProvider().getAllCountries();
        final selectedCountries = allCountries
            .where(
              (element) => element.name.common.contains(event.name),
            )
            .toList();
        emit(
          CountriesApiDoneState(
            countries: selectedCountries,
          ),
        );
      } catch (e) {
        log(e.toString());
        emit(CountriesApiErrorState(errorMsg: e.toString()));
      }
    });
  }
}
