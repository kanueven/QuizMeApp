import 'package:quizapp/objectbox.g.dart';

import '../model/questions.dart';

class Objectbox {
  late final Store store;
  late final Box<Questions> questionsBox;

  Objectbox._create(this.store){
    questionsBox = store.box<Questions>();

  }

  static Future<Objectbox> create() async{
    final store = await openStore();
    return Objectbox._create(store);

  }
}