import 'dart:math';

import 'package:countries_api/models/country.dart';
import 'package:countries_api/models/quiz_questions.dart';

List<QuizQuestions> generateQuestions(List<Country> countries , String type){
  final List<QuizQuestions> questions = [];
  countries.shuffle();
  final selected = countries.take(10).toList();
for(final correct in selected) {
 final other =  countries.where((c)=>c.name !=correct.name).toList();
  other.shuffle();
  final wrongOptions = other.take(3).toList();
  final options = [correct.name ,...wrongOptions.map((c) => c.name)]..shuffle();
  final questionText = switch(type){
    'flag' => correct.flagUrl,
    'capital' => correct.capital,
    'population' => correct.population.toString(),
    'language' => correct.languages[0],
    _ => correct.flagUrl,
  };
    questions.add(QuizQuestions(
    question: questionText,
     options: options,
     correctAnswer: correct.name));
}
return questions;
}