import 'package:countries_api/models/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
class CountryDetailScreen extends StatelessWidget {
  final Country? country;
  const CountryDetailScreen({super.key, this.country});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body:
            Center(child:
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Text('Country Detail' ,
                      style: TextStyle(fontSize: 22 , fontWeight: FontWeight.bold , )),
                const SizedBox(height: 25,),
                Text(country!.name ,
                  style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.bold),),
             Container(
                 padding: EdgeInsets.all(40),
                 margin: EdgeInsets.all(10),
                 decoration: BoxDecoration(
                   border: Border.all(color:Colors.black),
                     borderRadius: BorderRadius.circular(20),
                     gradient: LinearGradient(
                         begin : Alignment.topLeft,
                         end: Alignment.bottomRight,
                         colors: [Colors.white54 , Colors.blueAccent.withValues(alpha: 0.4)
                           , Colors.white12.withValues(alpha: 0.4)] )
                        ),
                         child:
                         Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                          children: [
                              Text( 'Capital: ${country?.capital}' ,
                                style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 20),),
                              const SizedBox(height: 15),
                              Text('Continent: ${country?.continent}',
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                              const SizedBox(height: 15),
                              Text('Languages: ${country?.languages}',
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                              const SizedBox(height: 15),
                              Text('Currencies: ${country?.currencies}',
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                              const SizedBox(height: 15),
                              Text('Population: ${country?.population}',
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        ]) )

       ]))) ;
  }
}




