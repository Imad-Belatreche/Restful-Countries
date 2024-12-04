import 'package:countries_restful/models/country.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CountryDetailsView extends StatelessWidget {
  final Country country;
  const CountryDetailsView({
    super.key,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Solve the problem with the SingleViewChild widget
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            country.name.common,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        body: SizedBox(
          height: 500,
          width: 100,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        SvgPicture.network(
                          country.flag.pngUrl,
                          width: double.infinity,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.white,
                                Colors.white.withOpacity(0.3),
                                Colors.white.withOpacity(0.1),
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
