import 'package:flutter/material.dart';
import 'package:quiz_app/Data/Placement_test.dart';
import 'package:quiz_app/Screens/result_Screen.dart';
import 'package:quiz_app/Widgets/QuestionWidget.dart';
import '../Models/Question_model.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  //page controller for pageview
  PageController? _controller = PageController(initialPage: 0);

  bool isPressed = false;
  Color btnColor = Colors.purple;
  Color righAnswerColor = Colors.green;
  Color wrongAnswerColor = Colors.red;

  int score = 0;
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return
        // home: const MainMenu(),
        Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: EdgeInsets.all(18.0),

        //pageview builder that has the same length as the questions

        child: PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          controller: _controller,
          onPageChanged: (page) {
            setState(() {
              isPressed = false;
            });
          },
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                questionWidget(
                    QuestionModel(
                        questions[index].question, questions[index].answer),
                    isPressed
                        ? () {}
                        : () {
                            setState(() {
                              isPressed = true;
                            });
                            if (questions[index]
                                .answer!
                                .entries
                                .toList()[i]
                                .value) {
                              score += 10;
                              print(score);
                            }
                          },
                    isPressed,
                    index,
                    righAnswerColor,
                    wrongAnswerColor,
                    questions),

                ///
                ///
                ///spacing
                ///
                ///

                SizedBox(
                  height: 20,
                ),

                // Next button question

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: isPressed
                          ? index + 1 == questions.length
                              ? () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ResultScreen(score),
                                      ));
                                }
                              : () {
                                  _controller!.nextPage(
                                      duration: Duration(milliseconds: 700),
                                      curve: Curves.fastLinearToSlowEaseIn);
                                  setState(() {
                                    isPressed = false;
                                  });
                                }
                          : null,
                      child: Text(index + 1 == questions.length
                          ? "finish Quiz"
                          : "next question"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple),
                    ),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
