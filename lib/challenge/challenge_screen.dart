import 'package:dquiz/challenge/challenge_controller.dart';
import 'package:dquiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:dquiz/challenge/widgets/question_indicator/question_indicator.dart';
import 'package:dquiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:dquiz/result/result_screen.dart';
import 'package:dquiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class ChallengeScreen extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;
  ChallengeScreen({Key? key, required this.questions, required this.title})
      : super(key: key);

  @override
  _ChalengeScreenState createState() => _ChalengeScreenState();
}

class _ChalengeScreenState extends State<ChallengeScreen> {
  var controller = ChallengeControler();
  var pageController = PageController();
  @override
  void initState() {
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
    super.initState();
  }

  void nextPage() {
    if (controller.currentPage < widget.questions.length)
      pageController.nextPage(
          duration: Duration(milliseconds: 150), curve: Curves.linear);
  }

  void onSelected(bool value) {
    if (value) controller.qtqAwnserRight++;
    nextPage();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),
        child: SafeArea(
            top: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.pop(context)),
                ValueListenableBuilder(
                  valueListenable: controller.currentPageNotifier,
                  builder: (context, value, _) => QuestionIndicator(
                    currentPage: controller.currentPage,
                    lenght: widget.questions.length,
                  ),
                )
              ],
            )),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions
            .map((e) => QuizWidget(
                  question: e,
                  onSelected: onSelected,
                ))
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: ValueListenableBuilder<int>(
              valueListenable: controller.currentPageNotifier,
              builder: (context, value, _) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // ignore: todo
                  // TODO
                  if (value < widget.questions.length)
                    Expanded(
                        child: NextButtonWidget.white(
                            label: 'Pular', onTap: nextPage)),
                  if (value == widget.questions.length)
                    Expanded(
                        child: NextButtonWidget.green(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResultScreen(
                                      result: controller.qtqAwnserRight,
                                      lenght: widget.questions.length,
                                      title: widget.title,
                                    )));
                      },
                      label: 'Confirmar',
                    )),
                ],
              ),
            )),
      ),
    );
  }
}
