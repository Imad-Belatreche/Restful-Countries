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
  final _focusNode = FocusNode();

  @override
  void initState() {
    country = widget.api.getAllCountries();
    _focusNode.addListener(
      () => setState(() {}),
    );
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  //TODO: Clean things a lil bit and improve the Theme

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        elevation: 6,
        shadowColor: Colors.black,
        centerTitle: true,
        title: SizedBox(
          width: 300,
          height: 40,
          child: TextField(
            controller: _searchController,
            cursorHeight: 17,
            autocorrect: true,
            enableSuggestions: true,
            focusNode: _focusNode,
            keyboardType: TextInputType.name,
            onChanged: (value) {
              context.read<CountriesApiBloc>().add(
                    CountriesApiSearchCountryEvent(
                      name: value.toLowerCase(),
                      allCountries: country,
                    ),
                  );
            },
            decoration: InputDecoration(
              icon: _focusNode.hasFocus
                  ? const Icon(CupertinoIcons.search)
                  : null,
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              hintText: "Search...",
              hintStyle: const TextStyle(color: Colors.black38),
            ),
          ),
        ),
      ),
      body: Center(
        child: FutureBuilder(
          future: country,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final countries = snapshot.data!;

              return BlocBuilder<CountriesApiBloc, CountriesApiState>(
                buildWhen: (previous, current) {
                  if (previous is CountriesApiLoadingState &&
                      current is CountriesApiDoneState) {
                    return true;
                  }
                  return false;
                },
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
                    return state.countries.isEmpty
                        ? const Center(
                            child: Text(
                              "Sorry sir, there are no country with that name.",
                            ),
                          )
                        : ListView.builder(
                            itemCount: state.countries.length,
                            itemBuilder: (context, index) {
                              return CountryItem(
                                item: state.countries[index],
                              );
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
