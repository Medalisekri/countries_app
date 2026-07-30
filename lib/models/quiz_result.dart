class QuizResult {
 final String type;
 final int score;
 final int totalQuestions;
 final  DateTime date;
 final String countriesName;

 QuizResult({
   required this.type,
   required this.score,
   required this.totalQuestions,
   required this.date,
   required this.countriesName,
});

 Map<String , dynamic> toJson(){
   return{
     'type':type,
     'score':score,
     'totalQuestions':totalQuestions,
     'date':date.toIso8601String(),
     'countriesName':countriesName
   };
 }

 factory QuizResult.fromJson(Map<String , dynamic> json){
   return QuizResult(
     type: json['type'],
     score: json['score'],
     totalQuestions: json['totalQuestions'],
     date: DateTime.parse(json['date']) ,
     countriesName: json['countriesName'],
   );
 }
}
