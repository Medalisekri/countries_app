import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/country.dart';

class CountryRepository {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://api.restcountries.com/countries/v5',
    headers: {
      'Authorization': 'Bearer ${dotenv.env['API_KEY']}',
      'Content-Type': 'application/json',
    },
  ));

  Future<List<Country>> fetchAllCountries() async {
    try {
      final response = await _dio.get('/all');
      if (response.statusCode == 200) {
        final List<dynamic> rawData = response.data;
        return rawData
            .map((item) => Country.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Something went wrong: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching countries: $e');
    }
  }
}