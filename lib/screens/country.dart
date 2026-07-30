import 'package:countries_api/providers/country.dart';
import 'package:countries_api/screens/country_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountryScreen extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(countryProvider);
    final c= state.countries;
    if(state.isLoading) {
      return Scaffold(
        body:SafeArea(child:
        Container(
          decoration: BoxDecoration(
          ),
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        ),
      ));
    }if(state.errorMessage!=null){
      return Scaffold(
        body:SafeArea(child:
        Container(
            decoration: BoxDecoration(

            ),
            child: Text(state.errorMessage!)
        ),
      ));
    }
    return Scaffold(
      body: SafeArea(child:
      Container(
        decoration: BoxDecoration(
        ),
        child:
        ListView.builder(
            itemCount: c.length,
            itemBuilder: (context , index){
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryDetailScreen(country:c[index])));
                },
                  child:
             Card(
                color: Colors.blue.withValues(alpha: 0.4),
                  shadowColor: Colors.black.withValues(alpha: 0.8),
                  elevation: 10,
                  margin: EdgeInsets.all(30),
                  child:
               ListTile(
                leading:c[index].flagUrl.isNotEmpty?
                Image.network( c[index].flagUrl ,width: 75, height: 75,):
                Text(c[index].name , style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 20),),
                title: Text(c[index].name),
              )));
            }),

      ),

    ));
  }
  }







