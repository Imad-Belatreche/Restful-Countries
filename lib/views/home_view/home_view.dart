import 'package:countries_restful/services/api/api_calls.dart';
import 'package:countries_restful/views/home_view/widgets/country_item.dart';
import 'package:countries_restful/models/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future<List<Country>> country;
  @override
  void initState() {
    country = const ApiCalls().getAllCountries("");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var name = "alg";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        elevation: 6,
        shadowColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Why it doesn't work ??
              setState(() {
                name = "united";
              });
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
              final counties = snapshot.data!;

              return ListView.builder(
                itemCount: counties
                    .where(
                      (element) =>
                          element.name.common.toLowerCase().contains(name),
                    )
                    .length,
                itemBuilder: (context, index) {
                  return CountryItem(
                    item: counties
                        .where(
                          (element) =>
                              element.name.common.toLowerCase().contains(name),
                        )
                        .toList()[index],
                  );
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
