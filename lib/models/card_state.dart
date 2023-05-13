import 'package:bug_web_stack/models/sign.dart';

// Holds the state of a memory card
class CardState {
  final Sign sign;
  bool completed;

  CardState({required this.sign})
      : completed = false;
}
