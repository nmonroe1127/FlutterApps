import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

//Stateful Widget:
// Can rebuild by itself.

//Stateless Widget:
// Will Never rebuild by itself. 
// all properties are immutable and you can only change them 
// by creating a new instance of the widget

//Both types can be "repainted" any number of times. 

// void main() {
//   runApp(MyApp());
// }

//Another way to do it when only one line in the main function
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  //Marking an instance member as overriding a superclass member
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

//Making this class only usable within this file by leading "_"
//Which turns it from a public to a private
class _MyAppState extends State<MyApp> {
  //Also make this a private property using "_"
  var _questionIndex = 0;
  var _totalScore = 0;

  //"const" would be compile time constant value
  //"final" makes the variable hold a constant value after being init
  final _questions = const [
    //Map (key value pairs)
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What is your favorite animal?',
      'answers': [
        {'text': 'Giraffe', 'score': 3},
        {'text': 'Dog', 'score': 11},
        {'text': 'Cat', 'score': 5},
        {'text': 'Fish', 'score': 9},
      ],
    },
    {
      'questionText': 'Who is your favorite instructor?',
      'answers': [
        {'text': 'Luke', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Helen', 'score': 1},
        {'text': 'Tony', 'score': 1},
      ],
    },
  ];

  //Set State will notify the framework that data has changed and that
  //It needs to be rebuilt
  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;  
    }); 
  }

  //Also make this a private class using "_"
  void _answerQuestion(int score) {
    _totalScore += score;
    //Sending it an anonymous function and recalling build
    //This is why questionIndex will update correctly now
    setState(() {
      _questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    //Will break because you are trying to add to a const list
    // var dummy = const ['Hello'];
    // dummy.add("max");

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        //If statement to see if any questions left
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            //Ending the if statement with an ":", then the else block
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
