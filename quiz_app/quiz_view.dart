import 'package:first/quiz_app/question.dart';
import 'package:flutter/material.dart';






class QuizApp extends StatefulWidget {

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {

  int _currentQuestionIndex = 0;

  List questionBank = [
    Question.name("The car is called nissan gtr", true),
    Question.name("It is back in color", false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("True Citizen"),
        centerTitle: true,
        // backgroundColor: Colors.blueGrey,
      ),
      // backgroundColor: Colors.blueGrey,
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center ,
            children: [
              Center(
                child: Image.asset("images/bg.jpg",
                  width: 250,
                  height: 180,),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(14.4),
                      border: Border.all(
                          color: Colors.blueGrey.shade400, style: BorderStyle.solid
                      )
                  ),
                  height: 120.0,
                  child: Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(questionBank[_currentQuestionIndex].questionText,
                      // style: TextStyle(fontSize: 16.9, color: Colors.white),
                    ),
                  )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: () {
                    _prevQuestion();
                  },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey.shade900,
                    ),
                    child:Icon(Icons.arrow_back),),

                  ElevatedButton(onPressed: () {
                    _checkAnswer(true, context);
                  },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey.shade900,
                    ),
                    child:Text("True"),),

                  ElevatedButton(onPressed: () {
                    _checkAnswer(false, context);
                  },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey.shade900,
                    ),
                    child:Text("False"),),

                  ElevatedButton(onPressed: () {
                    _nextQuestion();
                  },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey.shade900,
                    ),
                    child:Icon(Icons.arrow_forward),),

                ],
              ),
              Spacer(),
            ],

          ),
        ),
      ),
    );
  }

  _prevQuestion(){
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
    });
  }

  _checkAnswer( bool userChoice, BuildContext context) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {

      final snackbar = SnackBar(
          backgroundColor: Colors.green,
          duration: Duration(milliseconds: 500),
          content: Text("Correct"));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      _updateQuestion();

    } else {
      debugPrint("No");
      final snackbar = SnackBar(
          backgroundColor: Colors.redAccent,
          duration: Duration(milliseconds: 500),
          content: Text("Incorrect"));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      _updateQuestion();
    }
  }

  _updateQuestion(){
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }

  _nextQuestion(){
    _updateQuestion();

  }
}
