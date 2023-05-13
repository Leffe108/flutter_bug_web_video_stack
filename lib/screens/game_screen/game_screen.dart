import 'package:bug_web_stack/models/sign.dart';
import 'package:flutter/material.dart';
import 'package:bug_web_stack/models/card_state.dart';
import 'package:bug_web_stack/screens/game_screen/widgets/board.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<CardState> _board = [];

  @override
  void initState() {
    super.initState();
    _newGame(6);
  }

  Future<void> _newGame(int nPairs) async {
    // Clear the board so we can show a loading state.
    setState(() {
      _board.clear();
    });

    // Dummy data. In real app this would be populated from a remote API
    List<Sign> signs = [];
    for (var i = 0; i < nPairs; i += 1) {
      signs.add(Sign(
        id: "100$i",
        videoUrl: "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
      ));
    }

    // Add two cards for each sign to a new board array
    List<CardState> newBoard = [
      ...signs.map((s) => CardState(sign: s)),
      ...signs.map((s) => CardState(sign: s)),
    ];

    // Update widget state => repaint
    setState(() {
      _board = newBoard;
    });

    // This delayed update to completed state is critical to reproduce bug
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      for (var s in _board) {
        s.completed = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade200,
        elevation: 0,
        title: const Text('Web video stack bug', style: TextStyle(color: Colors.black)),
      ),
      body: _board.isNotEmpty
          // Loaded => show game board
          ? Board(
            data: _board,
          )
          // Loading state:
          : const Center(
            child: CircularProgressIndicator(),
          ),
    );
  }
}
