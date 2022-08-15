import 'package:flutter/material.dart';
import 'package:quiz_app/model/question.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex = 0;
  List questionBank = [
    Question.name(
        "1. M.S. Swaminathan led the Green Revolution in India in the 1960s.",
        true),
    Question.name(
        "2. In 1966 Indira Gandhi became the first woman Prime Minister of India.",
        true),
    Question.name(
        "3. The name of the committee replaced by ISRO in 1969 was National Committee for Space Research.",
        false),
    Question.name(
        "4. Dr. APJ Abdul Kalam and Dr. R. Chidambaram were the Chief Coordinators of Pokhran-II Tests conducted in 1998.",
        true),
    Question.name(
        "5. In the year 1950 first Lok Sabha elections held in India.", false),
    Question.name("6. India signed Panchsheel with Pakistan.", false),
    Question.name(
        "7. Air India was nationalised under Air Corporations Act, 1953.",
        true),
    Question.name("8. State Bank of India was founded in 1950.", false),
    Question.name(
        "9. For 22 months Emergency was imposed in India by Prime Minister Indira Gandhi.",
        false),
    Question.name("10. Jharkhand became the 26th State of India.", true),
  ];

  // "Who led the Green Revolution in India in the 1960s?","In which year Indira Gandhi became the first woman Prime Minister of India?",
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("True Citizen"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.blueGrey,
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'images/indian-flag.png',
                  width: 250,
                  height: 180,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: Colors.blueGrey.shade400,
                      style: BorderStyle.solid,
                    ),
                  ),
                  height: 120.0,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        questionBank[_currentQuestionIndex].questionText,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    onPressed: () => _prevQuestion(),
                    color: Colors.blueGrey.shade900,
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _checkAnswer(true, context),
                    color: Colors.blueGrey.shade900,
                    child: Text(
                      "TRUE",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _checkAnswer(false, context),
                    color: Colors.blueGrey.shade900,
                    child: Text(
                      "FALSE",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _nextQuestion(),
                    color: Colors.blueGrey.shade900,
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
      //  Correct Answer
      debugPrint("Yes, Correct Answer.");

      final snackbar = SnackBar(
        backgroundColor: Colors.green,
        duration: Duration(milliseconds: 500),
        content: Text("Correct!"),
      );
      Scaffold.of(context).showSnackBar(snackbar);

      _updateQuestion();

      // setState(() {
      //   _currentQuestionIndex++;
      // });
    } else {
      debugPrint("Wrong Answer");
      final snackbar = SnackBar(
        backgroundColor: Colors.redAccent,
        duration: Duration(milliseconds: 500),
        content: Text("Incorrect!"),
      );
      Scaffold.of(context).showSnackBar(snackbar);

      _updateQuestion();
    }
  }

  _updateQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }

  _nextQuestion() {
    _updateQuestion();
  }

  _prevQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
    });
  }
}
