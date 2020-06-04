import 'package:flutter/material.dart';
import 'package:quiz_app/model/question.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  var _currentQuestionIndex = 0;

  List questionBank = [
    Question.name(
        'Cyclones spin in a clockwise direction in the southern hemisphere',
        true),
    Question.name('Goldfish only have a memory of three seconds', false),
    Question.name('The capital of Libya is Benghazi', false),
    Question.name(
        'Brazil is the only country in the Americas to have the official language of Portuguese',
        true),
    Question.name(
        'The Channel Tunnel is the longest rail tunnel in the world', false),
    Question.name(
        'Darth Vader famously says the line “Luke, I am your father” in The Empire Strikes Back',
        false),
    Question.name('Stephen Hawking declined a knighthood from the Queen', true),
    Question.name('The highest mountain in England is Ben Nevis', false),
    Question.name(
        'Nicolas Cage and Michael Jackson both married the same woman', true),
    Question.name(
        'Japan and Russia did not sign a peace treaty after World War Two so are technically still at war',
        true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GK Quiz'),
        centerTitle: true,
        // backgroundColor: Colors.lightBlue,
      ),
      // backgroundColor: Colors.yellowAccent.shade100,

      // we use [Builder] here to use a [context] that is a descendent of [Scaffold]
      // or else [Scaffold.of] will return null
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                  child:
                      Image.asset('images/flag.png', width: 250, height: 180)),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.4),
                      border: Border.all(
                          color: Colors.blueGrey.shade400,
                          style: BorderStyle.solid)),
                  height: 120.0,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      questionBank[_currentQuestionIndex].questionText,
                      // style: TextStyle(fontSize: 16.9, color: Colors.blueAccent),
                    ),
                  )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () => _previousQuestion(),
                    color: Colors.lightBlue.shade900,
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _checkAnswer(true, context),
                    color: Colors.lightBlue.shade900,
                    child: Text(
                      'TRUE',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _checkAnswer(false, context),
                    color: Colors.lightBlue.shade900,
                    child: Text(
                      'FALSE',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _nextQuestion(),
                    color: Colors.lightBlue.shade900,
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  _checkAnswer(bool userChoice, BuildContext context) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      final snackBar = SnackBar(
        duration: Duration(milliseconds: 500),
        content: Text('Correct!'),
        backgroundColor: Colors.lightGreen,
      );
      Scaffold.of(context).showSnackBar(snackBar);
      _updateQuestion();
    } else {
      final snackBar = SnackBar(
        duration: Duration(milliseconds: 500),
        content: Text('Incorrect!'),
        backgroundColor: Colors.redAccent,
      );
      Scaffold.of(context).showSnackBar(snackBar);
      _updateQuestion();
    }
  }

  _previousQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
    });
  }

  _updateQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }

  _nextQuestion() {
    _updateQuestion();
  }
}
