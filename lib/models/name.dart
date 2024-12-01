class Name {
  final String common;
  final String official;

  const Name({
    required this.common,
    required this.official,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        common: json["common"] as String,
        official: json["official"] as String,
      );
}