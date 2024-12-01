import 'package:countries_restful/blocs/bloc/countries_api_bloc.dart';
import 'package:countries_restful/services/api/api_provider.dart';
import 'package:countries_restful/views/home_view/widgets/country_item.dart';
import 'package:countries_restful/models/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  final ApiProvider api;
  const HomeView({super.key, required this.api});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future<List<Country>> country;
  final _searchController = TextEditingController();

  @override
  void initState() {
    country = widget.api.getAllCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        elevation: 6,
        shadowColor: Colors.black,
        actions: [
          SizedBox(
            width: 150,
            height: 40,
            child: TextField(
              controller: _searchController,
              cursorHeight: 17,
              autocorrect: true,
              enableSuggestions: true,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                hintText: "Search...",
                hintStyle: TextStyle(color: Colors.black38),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              final name = _searchController.text.trim().toLowerCase();
              context.read<CountriesApiBloc>().add(
                    CountriesApiSearchCountryEvent(name: name),
                  );
            },
            icon: const Icon(CupertinoIcons.search),
          )
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: country,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final countries = snapshot.data!;

              return BlocBuilder<CountriesApiBloc, CountriesApiState>(
                bloc: CountriesApiBloc(),
                builder: (context, state) {
                  if (state is CountriesApiInitialState) {
                    return ListView.builder(
                      itemCount: countries.length,
                      itemBuilder: (context, index) {
                        return CountryItem(
                          item: countries[index],
                        );
                      },
                    );
                  } else if (state is CountriesApiDoneState) {
                    return ListView.builder(
                      itemCount: state.countries.length,
                      itemBuilder: (context, index) {
                        return CountryItem(item: state.countries[index]);
                      },
                    );
                  } else if (state is CountriesApiLoadingState) {
                    return const CircularProgressIndicator();
                  } else {
                    throw Exception("Something bad happened");
                  }
                },
              );
            } else if (snapshot.hasError) {
              return Text(
                snapshot.error.toString(),
                style: Theme.of(context).textTheme.bodyMedium,
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
