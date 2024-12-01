class Currency {
  final String name;
  final String symbol;

  Currency({
    required this.name,
    required this.symbol,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        name: json["name"],
        symbol: json["symbol"],
      );
}