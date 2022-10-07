import 'package:flutter/material.dart';
import 'package:quiz_app/ui/colors.dart';
import '../Models/Question_model.dart';

Widget questionWidget(
    QuestionModel questionModel,
    void Function() function,
    bool pressed,
    int index,
    Color righAnswerColor,
    Color wrongAnswerColor,
    List length) {
  return Column(
    children: [
      SizedBox(
        width: double.infinity,
        child: Text(
          "Question ${index + 1}/${length.length}",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      Divider(
        thickness: 2,
        height: 8,
      ),
      SizedBox(
        height: 20,
      ),
      SizedBox(
        width: double.infinity,
        height: 200.0,
        child: Text(
          "${questionModel.question}",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
          ),
        ),
      ),
      for (int i = 0; i < questionModel.answer!.length; i++)
        Container(
          padding: EdgeInsets.all(1),
          width: double.infinity,
          height: 40,
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            color: pressed
                ? questionModel.answer!.entries.toList()[i].value
                    ? righAnswerColor
                    : wrongAnswerColor
                : Colors.purple,
            onPressed: function,
            child: Text(questionModel.answer!.keys.toList()[i]),
          ),
        )
    ],
  );
}
