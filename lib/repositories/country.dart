import 'package:countries_api/models/country.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CountryRepository  {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'api_url',
    headers: {
      'Authorization' :'Bearer ${dotenv.env['API_KEY']}',
      'Content-Type':'application/json'
    }
  ));

  Future<List<Country>> fetchAllCountries() async{
    try{
    final response = await _dio.get('/all');
    if(response.statusCode==200){
      final List<dynamic> rawData = response.data;
      return rawData.map((item)=>Country.fromJson(item as Map<String , dynamic>)).toList();
    }else{
      throw Exception('Something went wrong ${response.statusMessage} ');
    }}catch(e){
      throw Exception('Something went wrong');
    }
  }
}