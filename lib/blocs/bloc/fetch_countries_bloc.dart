import 'dart:developer';
import 'package:countries_restful/services/api/api_calls.dart';
import 'package:countries_restful/models/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_countries_event.dart';
part 'fetch_countries_state.dart';

class FetchCountriesBloc
    extends Bloc<FetchCountriesEvent, FetchCountriesState> {
  FetchCountriesBloc() : super(FetchCountriesInitialState()) {
    on<FetchCountriesBasicEvent>((event, emit) async {
      emit(FetchCountriesLoadingState());
      try {
        final country = await const ApiCalls().getAllCountries(event.name);
        emit(
          FetchCountriesDoneState(
            country: country,
          ),
        );
      } catch (e) {
        log(e.toString());
        emit(FetchCountriesErrorState(errorMsg: e.toString()));
      }
    });
  }
}
