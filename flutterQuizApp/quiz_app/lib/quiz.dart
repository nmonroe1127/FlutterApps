import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final int questionIndex;
  //Using named arguments
  Quiz({
    @required this.questions,
    @required this.answerQuestion,
    @required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Using the Question class that was created instead of Text
        Question(
          questions[questionIndex]['questionText'],
        ),
        //"..." is spread operator. Takes a list and pulls all
        //values out of the list and then puts them into the new list
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList()
        //Converting value that map gives us to a list
      ],
    );
  }
}
