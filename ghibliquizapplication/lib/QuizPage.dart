import 'dart:collection';
import 'package:ghibliquizapplication/Characters.dart';
import 'package:flutter/material.dart';
import 'package:ghibliquizapplication/Charactersdao.dart';
import 'package:ghibliquizapplication/ResultPage.dart';

class QuizPage extends StatefulWidget {

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  var questions = <Characterss>[];
  var falseOptions = <Characterss>[];
  late Characterss trueQuestion;
  var allOptions = HashSet<Characterss>();

  int questionCounter = 0;
  int trueCounter = 0;
  int falseCounter = 0;

  String characterPicName = "placeholder.png";
  String buttonAtext = "";
  String buttonBtext = "";
  String buttonCtext = "";
  String buttonDtext = "";

  @override
  void initState() {
    super.initState();
    getQuestions();


  }

  Future<void> getQuestions() async {
    questions = await Charactersdao().bringrandom40();
    uploadQuestions();
  }

  Future<void> uploadQuestions() async {
    trueQuestion = questions[questionCounter];

    characterPicName = trueQuestion.character_pic;
    
    falseOptions = await Charactersdao().bringrandom3false(trueQuestion.character_id);
    allOptions.clear();
    allOptions.add(trueQuestion);
    allOptions.add(falseOptions[0]);
    allOptions.add(falseOptions[1]);
    allOptions.add(falseOptions[2]);

    buttonAtext = allOptions.elementAt(0).character_name;
    buttonBtext = allOptions.elementAt(1).character_name;
    buttonCtext = allOptions.elementAt(2).character_name;
    buttonDtext = allOptions.elementAt(3).character_name;

    setState(() {

    });
  }

  void questionCounterCheck(){
    questionCounter = questionCounter + 1;

    if(questionCounter != 40){
      uploadQuestions();
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResultPage(numberoftrue: trueCounter,)));

    }
  }

  void trueControl(String buttonText){
    if(trueQuestion.character_name == buttonText){
      trueCounter = trueCounter+1;
    }else{
      falseCounter = falseCounter +1;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Quiz Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("True : $trueCounter",style: TextStyle(fontSize: 20 , color: Colors.yellow[100]),),
                Text("False : $falseCounter",style: TextStyle(fontSize: 20, color: Colors.yellow[100]),),
              ],
            ),
            questionCounter != 40 ? Text("Question ${questionCounter+1}",style: TextStyle(fontSize: 25, color: Colors.yellow[100]),) :
            Text("Question 40",style: TextStyle(fontSize: 25, color: Colors.yellow[100]),),
            Image.asset("pictures/$characterPicName"),
            SizedBox( width: 250, height: 50,
              child: ElevatedButton(
                child: Text(buttonAtext),
                onPressed: (){
                  trueControl(buttonAtext);
                  questionCounterCheck();

                },
              ),
            ),
            SizedBox( width: 250, height: 50,
              child: ElevatedButton(
                child: Text(buttonBtext),
                onPressed: (){
                  trueControl(buttonBtext);
                  questionCounterCheck();
                },
              ),
            ),
            SizedBox( width: 250, height: 50,
              child: ElevatedButton(
                child: Text(buttonCtext),
                onPressed: (){
                  trueControl(buttonCtext);
                  questionCounterCheck();

                },
              ),
            ),
            SizedBox( width: 250, height: 50,
              child: ElevatedButton(
                child: Text(buttonDtext),
                onPressed: (){
                  trueControl(buttonDtext);
                  questionCounterCheck();


                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
