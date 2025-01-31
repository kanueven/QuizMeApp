import 'package:objectbox/objectbox.dart';

@Entity()
class Questions {
  int id;
  String text;
  String option1;
  String option2;
  String option3;
  int correctAnswer;
  
  Questions({
    this.id=0,
    required this.text,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.correctAnswer,

  });
}