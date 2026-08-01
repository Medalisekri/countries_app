import 'package:countries_api/models/country.dart';
import 'package:countries_api/models/quiz_questions.dart';
import 'package:countries_api/providers/country.dart';
import 'package:countries_api/providers/quiz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuizScreen extends ConsumerStatefulWidget {

  final QuizQuestions? quiz;
  const QuizScreen({super.key, this.quiz});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuizScreen();

}
class _QuizScreen extends ConsumerState<QuizScreen>{
String? selectedAnswer;
  @override
  Widget build(BuildContext context) {
   final state = ref.watch(quizProvider);
   final countryState = ref.read(countryProvider);
   final countries = countryState.countries;

   //final List<QuizQuestions> q = state.questions.where((u)=>u.questions!=null).toList();
   if(state.questions.isEmpty){


    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Column(
        children: [
          TextButton(onPressed: (){
            ref.read(quizProvider.notifier).startQuiz(countries);
          }, child: Text('Start') )
        ],
      ),
    );
   }
   if(state.currentIndex>=state.questions.length){
      return Scaffold(
        appBar: AppBar(),
        body:  Text('Your Score is: ${state.score}/${state.questions.length} '),
      );
    }
   final currentQuestion = state.questions[state.currentIndex];

   return Scaffold(
    appBar: AppBar(),
    body: Column(children: [
      Expanded(child:
      Image.network(currentQuestion.question),

      ),
      for(String option in currentQuestion.options)

        TextButton(
            onPressed:  (){

      if(!state.answered) {
        setState(() => selectedAnswer = option);
        ref.read(quizProvider.notifier).answerQuestion(option);
      }

        }, style: TextButton.styleFrom(
            foregroundColor: selectedAnswer==null?Colors.black :
            option ==currentQuestion.correctAnswer?Colors.green: option == selectedAnswer?Colors.red:Colors.black),
            child:Text(option)
        ),
if(state.answered)

    TextButton(onPressed: () {
      setState(()=>selectedAnswer =null

      );
      ref.read(quizProvider.notifier).nextQuestion();  },
      child: Text('Next'),),

        ],),
  );
   

  }

}