import 'package:DevQuiz/challenge/widgets/answer/answer_widget.dart';
import 'package:DevQuiz/challenge/widgets/quiz/quiz_controller.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/shared/models/answer_model.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onSelected;
  const QuizWidget({
    Key? key,
    required this.question,
    required this.onSelected,
  }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int? indexSelected = -1;

  AnswerModel answer(int index) => widget.question.answers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          SizedBox(
            height: 64,
          ),
          Center(
            child: Text(
              widget.question.title,
              style: AppTextStyles.heading,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          for (int i = 0; i < widget.question.answers.length; i++)
            AnswerWidget(
              answer: answer(i),
              isSelected: indexSelected == i,
              onTap: () {
                indexSelected = i;
                widget.onSelected(answer(i).isRight);
                setState(() {});
              },
            )
        ],
      ),
    );
  }
}
