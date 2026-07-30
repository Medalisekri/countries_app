
import 'package:countries_api/models/country.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CountryRepository  {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://api.restcountries.com/countries/v5',
    headers: {
      'Authorization' :'Bearer ${dotenv.env['API_KEY']}',
      'Content-Type':'application/json'
    }
  ));
  Future<List<Country>> fetchAllCountries() async {
    try {
      const int limit = 100;
      int offset = 0;
      final List<Country> countries = [];
      while (true) {
        final response = await _dio.get(
          '',
          queryParameters: {
            'limit': limit,
            'offset': offset,
          },
        );
        if (response.statusCode != 200) {
          throw Exception(
            'Request failed: ${response.statusCode} ${response.statusMessage}',
          );
        }
        final List<dynamic> rawData =
        response.data['data']['objects'] as List<dynamic>;
        final int fetchedCount = rawData.length;
       rawData.removeWhere(
              (country) => country['names']['common'] == 'Northern Cyprus',
        );
        rawData.removeWhere(
              (country) => country['names']['common'] == 'Abkhazia',
        );
        rawData.removeWhere(
              (country) => country['names']['common'] == 'Israel',
        );
        rawData.removeWhere(
              (country) => country['names']['common'] == 'Somaliland',
        );
        rawData.removeWhere(
              (country) => country['names']['common'] == 'South Ossetia',
        );
        countries.addAll(
          rawData
              .map((item) => Country.fromJson(item as Map<String, dynamic>))
              .toList(),
        );
        if (fetchedCount < limit) {
          break;
        }
        offset += limit;
      }
      return countries;
    } on DioException catch (e) {
      throw Exception(
        e.response?.data.toString() ?? e.message ?? 'Failed to fetch countries',
      );
    } catch (e) {
      throw Exception('Something went wrong: $e');
    }
  }
}