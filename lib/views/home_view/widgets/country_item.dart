import 'package:countries_restful/models/country.dart';
import 'package:countries_restful/views/country_details_view/country_details_view.dart';
import 'package:countries_restful/views/routes.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CountryItem extends StatelessWidget {
  final Country item;

  const CountryItem({
    required this.item,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CountryDetailsView(country: item),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.white,
          elevation: 7,
          shadowColor: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.name.common,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Area: ${item.area.ceil()} km²"),
                        Text("Population: ${item.population}"),
                        item.timeZones.singleOrNull == null
                            ? Text("Time Zones: ${item.timeZones.first}...")
                            : Text("Time Zones: ${item.timeZones.first}"),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Code: ${item.cca3}"),
                        Text("Continents: ${item.continents.singleOrNull}"),
                        item.languages.singleOrNull == null
                            ? Text("Languages: ${item.languages.first} ...")
                            : Text("Languages: ${item.languages.first}"),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: SizedBox(
                    width: 200,
                    height: 100,
                    child: SvgPicture.network(item.flag.pngUrl),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
