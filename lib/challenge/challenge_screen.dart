import 'package:DevQuiz/challenge/challenge_controller.dart';
import 'package:DevQuiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:DevQuiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:DevQuiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/result/result_screen.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChallengeScreen extends StatefulWidget {
  final String title;
  final List<QuestionModel> questions;

  const ChallengeScreen(
      {Key? key, required this.questions, required this.title})
      : super(key: key);

  @override
  _ChallengeScreenState createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  final controller = ChallengeController();
  final pageController = PageController();
  @override
  void initState() {
    controller.currentPageNotifier.addListener(() {
      setState(() {});
    });
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions
            .map((e) => QuizWidget(
                  question: e,
                  onSelected: (bool value) {
                    if (value) {
                      controller.acertos++;
                    }
                  },
                ))
            .toList(),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButton(),
            ValueListenableBuilder<int>(
              valueListenable: controller.currentPageNotifier,
              builder: (context, value, _) => QuestionIndicatorWidget(
                currentPage: value + 1,
                length: widget.questions.length,
              ),
            )
          ],
        )),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                controller.currentPage + 1 < widget.questions.length
                    ? Expanded(
                        child: NextButtonWidget(
                        onTap: () {
                          pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.linear);
                        },
                        label:
                            controller.currentPage + 1 < widget.questions.length
                                ? "Pular"
                                : "Início",
                        backgroundColor: AppColors.white,
                        fontColor: AppColors.grey,
                        borderColor: AppColors.border,
                      ))
                    : SizedBox(),
                SizedBox(
                  width: 7,
                ),
                controller.currentPage + 1 == widget.questions.length
                    ? Expanded(
                        child: NextButtonWidget(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResultScreen(
                                      title: widget.title,
                                      acertos: controller.acertos,
                                      total: widget.questions.length)));
                        },
                        label: "Confirmar",
                        backgroundColor: AppColors.darkGreen,
                        fontColor: AppColors.white,
                        borderColor: AppColors.darkGreen,
                      ))
                    : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
