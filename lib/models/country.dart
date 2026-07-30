class Country {
  final String name;
  final String continent;
  final String capital;
  final int population;
  final String flagUrl;
  final List<String> currencies;
  final List<String> languages;

  const Country({
    required this.name,
    required this.continent,
    required this.capital,
    required this.population,
    required this.flagUrl,
    required this.currencies,
    required this.languages,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    final capitals = json['capitals'] as List;
    final continents = json['continents'] as List;

    return Country(
      name: json['names']['common'],
      continent: continents.isEmpty ? '' : continents.first,
      capital: capitals.isEmpty ? '' : capitals.first['name'],
      population: json['population'],
      flagUrl: json['flag']['url_png'],
      currencies: (json['currencies'] as List)
          .map((c) => c['name'] as String)
          .toList(),
      languages: (json['languages'] as List)
          .map((l) => l['name'] as String)
          .toList(),
    );
  }

}