import 'package:countries_restful/models/country.dart';
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
    return Padding(
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
                      Text("Area: ${item.area}"),
                      Text("Population: ${item.population}"),
                      Text("Time Zones: ${item.timeZones.first}")
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Code: ${item.cca3}"),
                      Text("Continents: ${item.continents.singleOrNull}"),
                      Text("Languages: ${item.languages}"),
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
    );
  }
}
