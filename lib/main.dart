//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './quiz1.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState(); //underscore change private class to a public class
  }
}

class _MyAppState extends State<MyApp> {
  //this state belongs to MyApp class
  final _questions = const [
    {
      'questionText': 'Whats your fav colour?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'questionText': 'whats your fav animal',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Snake', 'score': 5},
        {'text': 'Elephant', 'score': 3},
        {'text': 'Lion', 'score': 1}
      ],
    },
    {
      'questionText': 'who\'s your fav instructor',
      'answers': [
        {'text': 'A', 'score': 10},
        {'text': 'B', 'score': 5},
        {'text': 'C', 'score': 3},
        {'text': 'D', 'score': 1}
      ],
    },
  ];

  //questions = [];//does not work if question is a constant
  var _qindex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _qindex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    // var aBool=true;
    // aBool=false;

    _totalScore = _totalScore + score;
    setState(() {
      _qindex = _qindex + 1;
    });
    print(_qindex);
    if (_qindex < _questions.length) {
      print("We have more questions!");
    } else
      print('No More questions!');
    //print('Answer chosen!'); //get printed in terminal when we run and button enabled
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first App'),
        ),
        body: _qindex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                qindex: _qindex,
                questions: _questions)
            : Result(_totalScore, _resetQuiz),
        //questions.elementAt(0),
        //questions[0],

        // RaisedButton(
        //   child: Text('Answer 1'),
        //   onPressed:
        //       _answerQuestion, //passing a pointer at the function onPressed
        // )
        // Answer(_answerQuestion),
        // Answer(_answerQuestion),
        // Answer(_answerQuestion)

        // RaisedButton(
        //   child: Text('Answer 2'),
        //   onPressed: () => print('Answer 2 chosen!'),
        // ),
        // RaisedButton(
        //   child: Text('Answer 3'),
        //   onPressed: () {
        //     //..
        //     print('Answer 3 chosen!');
        //   },
        // ),

        // : Center(
        //     child: Text('You did it!'),
        //   ),
      ),
    );
  }
}
