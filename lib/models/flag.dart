class Flag {
  final String pngUrl;

  Flag({
    required this.pngUrl,
  });

  factory Flag.fromJson(Map<String, dynamic> json) => Flag(
        pngUrl: json["svg"] as String,
      );
}
