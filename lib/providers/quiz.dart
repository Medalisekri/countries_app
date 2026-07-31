

import 'package:countries_api/core/utils/quiz_helper.dart';
import 'package:countries_api/models/country.dart';
import 'package:countries_api/models/quiz_questions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class QuizState {
  final List<QuizQuestions> questions;
  late final int currentIndex;
  late final int score;
  final bool answered;
  QuizState({
    this.questions = const[],
    this.currentIndex = 0,
    this.score = 0,
    this.answered = false,
});
  QuizState copyWith({
    List<QuizQuestions>? questions,
    int? currentIndex,
    int? score,
    bool? answered,
  }) {
    return QuizState(
      questions: questions ?? this.questions,
      currentIndex: currentIndex ?? this.currentIndex,
      score: score ?? this.score,
      answered: answered ?? this.answered,
    );
  }
}



class QuizProvider extends StateNotifier<QuizState> {
  QuizProvider() : super(QuizState());

  void startQuiz( List<Country> countries){
    final questions =generateQuestions(countries);
    state = QuizState(questions: questions);
  }

  void answerQuestion(String answer){
    if(answer == state.questions[state.currentIndex].correctAnswer){
      state = state.copyWith(score: state.score + 1 , answered: true);
    }
  }
  void nextQuestion(){
    state = state.copyWith(currentIndex: state.currentIndex ++ , answered: false);
  }


}