import 'package:flutter/material.dart';
import 'package:quiz_app/main.dart';

class ResultScreen extends StatefulWidget {
  final int score;
  const ResultScreen(this.score, {super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              widget.score >= 50
                  ? "You're level is advanced"
                  : "Your level is beginner",
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyApp(),
                    ));
              }),
              child: Text("proceed to the lesseons"))
        ],
      ),
    );
  }
}
