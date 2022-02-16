import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mcqtask/models/questions_model.dart';
import 'package:mcqtask/modules/result.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  List<bool> isChecked = List.generate(4, (index) => false);
  late int currentQuestion;
  int num = 0;
  int score = 0; // int number that get the next index
  var answer; // var for the chosen answer
  late List answersList; // a new list to shuffle answer in it
  late List<int>
      generatedNumbers; // list to generate random numbers for the question

  @override
  void initState() {
    shuffleList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exam'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              questions[currentQuestion]['question'],
              style: const TextStyle(fontSize: 25),
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context, index) {
              return CheckboxListTile(
                title: Text('${answersList[index]}'),
                value: isChecked[index],
                onChanged: (newValue) {
                  setState(() {
                    if (isChecked.contains(true)) {
                      isChecked[index] = false;
                    } else {
                      isChecked[index] = newValue!;
                      answer = questions[currentQuestion]['answers'][index];
                    }
                  });
                },
                controlAffinity:
                    ListTileControlAffinity.leading, //  leading Checkbox
              );
            },
          ),
          Container(
            width: 200,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.blue),
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextButton(
              onPressed: () {
                checkAnswer();
              },
              child: num == 4
                  ? const Text(
                      'Finish',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  : const Text(
                      'Next',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            'Score $score/5',
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  ///Function to Shuffle the questions and answers
  void shuffleList() {
    generatedNumbers = List<int>.generate(5, (int index) => index);
    generatedNumbers.shuffle();
    currentQuestion = generatedNumbers[num];
    answersList = questions[currentQuestion]['answers'];
    answersList.shuffle();
  }

  ///function to Check Answer
  void checkAnswer() {
    ///check if answer is correct with answers list
    if (answer == correctAnswer[currentQuestion]) {
      Fluttertoast.showToast(msg: 'Correct Answer');
      setState(() {
        if (num < 4) {
          num++;
          currentQuestion = generatedNumbers[num];
          answersList = questions[currentQuestion]['answers'];
          answersList.shuffle();
        } else if (num == 4) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => ResultScreen(result: score)),
              (route) => false);
        }
        for (int i = 0; i < isChecked.length; i++) {
          isChecked[i] = false;
        }
        score++;
      });
    } else {
      Fluttertoast.showToast(msg: 'Incorrect Answer');
      setState(() {
        if (num < 4) {
          num++;
          currentQuestion = generatedNumbers[num];
          answersList = questions[currentQuestion]['answers'];
          answersList.shuffle();
        } else if (num == 4) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => ResultScreen(result: score)),
              (route) => false);
        }
        for (int i = 0; i < isChecked.length; i++) {
          isChecked[i] = false;
        }
      });
    }
  }
}
