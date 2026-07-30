import 'package:countries_api/providers/country.dart';
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
        body: Container(
          decoration: BoxDecoration(

          ),
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        ),
      );
    }if(state.errorMessage!=null){
      return Scaffold(
        body: Container(
            decoration: BoxDecoration(

            ),
            child: Text(state.errorMessage!)
        ),
      );
    }
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(

        ),
        child:
        ListView.builder(
            itemCount: c.length,
            itemBuilder: (context , index){
              return ListTile(
                leading:c[index].flagUrl.isNotEmpty?
                Image.network( c[index].flagUrl ,width: 75, height: 75,):
                Text(c[index].name , style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 20),) ,
              );
            }),

      ),

    );
  }
  }







