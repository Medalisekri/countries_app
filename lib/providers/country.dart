
import 'package:countries_api/models/country.dart';
import 'package:countries_api/repositories/country.dart';
import 'package:flutter_riverpod/legacy.dart';
class CountriesState{
  final List<Country> countries;
  final bool isLoading;
  final String? errorMessage;

  CountriesState({
     this.countries = const[],
    this.isLoading = false,
    this.errorMessage,
});
}
class CountryProvider extends StateNotifier<CountriesState>  {

  CountryProvider():super( CountriesState()){
    loadCountries();
  }
  final _repository = CountryRepository();
  void loadCountries() async{
    try {
      state = CountriesState(countries: [], isLoading: true);
    final r = await _repository.fetchAllCountries();
      state = CountriesState(countries: r, isLoading: false);

    }catch(e){
      state = CountriesState(errorMessage: 'Something went wrong',isLoading: false);
    }
  }
} final countryProvider = StateNotifierProvider<CountryProvider  , CountriesState>(
    (ref)=>CountryProvider(),
);