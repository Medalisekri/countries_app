class Country {
  final String name;
  final String continent;
  final String capital;
  final int population;
  final String flagUrl;
  final List<String> currencies;
  final List<String> languages;

    Country({
    required this.name,
      required this.continent,
      required this.capital,
      required this.population,
      required this.flagUrl,
      required this.currencies,
      required this.languages
}
  );


    factory Country.fromJson(Map<String ,dynamic> json){
      return Country(
        name: json['name']['common'],
        continent: json['continents'][0],
        capital:json['capitals'][0]['name'],
        population: json['population'],
        flagUrl: json['flags']['png'],
        currencies: List<String>.from(json['currencies'].values.map((c)=>c['name'])),
        languages: List<String>.from(json['languages'].values),
      );
    }

}