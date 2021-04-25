import 'package:DevQuiz/challenge/widgets/quiz/quiz_controller.dart';
import 'package:flutter/material.dart';

import 'package:DevQuiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:share_plus/share_plus.dart';

class ResultScreen extends StatelessWidget {
  final String title;
  final int acertos;
  final int total;
  const ResultScreen({
    Key? key,
    required this.title,
    required this.acertos,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(flex: 2, child: Image.asset(AppImages.trophy)),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Text(
                    "Parabéns",
                    style: AppTextStyles.heading40,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 93),
                    child: Text.rich(
                      TextSpan(
                          text: "Você concluiu",
                          style: AppTextStyles.body,
                          children: [
                            TextSpan(
                                text: "\n$title",
                                style: AppTextStyles.bodyBold),
                            TextSpan(
                                text: "\ncom $acertos de $total acertos.",
                                style: AppTextStyles.body),
                          ]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 68),
                          child: NextButtonWidget(
                              label: "Compartilhar",
                              backgroundColor: AppColors.purple,
                              fontColor: AppColors.white,
                              borderColor: AppColors.purple,
                              onTap: () {
                                Share.share("DevQuizz NLW5 - Flutter");
                              }),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 68),
                          child: NextButtonWidget(
                              label: "Voltar ao início",
                              backgroundColor: Colors.transparent,
                              fontColor: AppColors.grey,
                              borderColor: Colors.transparent,
                              onTap: () {
                                Navigator.pop(context);
                              }),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
