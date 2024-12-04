import 'package:countries_restful/blocs/bloc/countries_api_bloc.dart';
import 'package:countries_restful/blocs/simple_bloc_observer.dart';
import 'package:countries_restful/services/api/api_provider.dart';
import 'package:countries_restful/views/home_view/home_view.dart';
import 'package:countries_restful/views/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CountriesApiBloc(),
        ),
      ],
      child: MaterialApp(
        title: "Restful Countries",
        debugShowCheckedModeBanner: false,
        routes: {
          home: (context) => HomeView(api: ApiProvider()),
        },
        home: HomeView(
          api: ApiProvider(),
        ),
      ),
    ),
  );
}
