import 'package:flutter/material.dart';
import 'package:quizapp/main.dart';
import 'package:quizapp/model/questions.dart';
import 'dart:developer' as developer;

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<Questions> questions = [];
  int currentIndex = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  void _loadQuestions() {
  if (objectbox.questionsBox.isEmpty()) { 
    //my own sample questions
    objectbox.questionsBox.putMany([
      Questions(
        text: "What is the capital of Kenya?",
        option1: "Nairobi",
        option2: "Mombasa",
        option3: "Kiambu",
        correctAnswer: 1,
      ),
      Questions(
        text: "What is the capital of France?",
        option1: "Berlin",
        option2: "Madrid",
        option3: "Paris",
        correctAnswer: 3,
      ),
    ]);
  }
  questions = objectbox.questionsBox.getAll();
  developer.log("Loaded questions: ${questions.length}");
}


  void _answerQuestion(int selectedAnswer) {
    if (selectedAnswer == questions[currentIndex].correctAnswer) {
      setState(() {
        score++;
      });
    }

    if (currentIndex < questions.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      _showResult();
    }
  }

  void _showResult() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("You have finished the quiz"),
          content: Text("Your score is $score out of ${questions.length}"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  currentIndex = 0;
                  score = 0;
                });
              },
              child: const Text("Restart"),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
     developer.log("Questions list length: ${questions.length}");
    if (questions.isEmpty) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final question = questions[currentIndex];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz App"),
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              question.text,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _answerQuestion(1),
              child: Text(question.option1),
            ),

            ElevatedButton(
              onPressed: () => _answerQuestion(2),
              child: Text(question.option2),
            ),

            ElevatedButton(
              onPressed: () => _answerQuestion(3),
              child: Text(question.option3),
            ),
            const SizedBox(height: 20),
            Text(
              "Score: $score",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}