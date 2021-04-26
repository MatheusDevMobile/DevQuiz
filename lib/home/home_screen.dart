import 'dart:io';

import 'package:dquiz/challenge/challenge_screen.dart';
import 'package:dquiz/core/app_colors.dart';
import 'package:dquiz/home/widgets/app_Bar/app_Bar.dart';
import 'package:dquiz/home/widgets/home_controller.dart';
import 'package:dquiz/home/widgets/home_state.dart';
import 'package:dquiz/home/widgets/level_button/level_button.dart';
import 'package:dquiz/home/widgets/quiz_card/quiz_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      return Scaffold(
        appBar: AppBarWidget(
          user: controller.user!,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LevelButton(label: "Fácil"),
                  LevelButton(label: "Médio"),
                  LevelButton(label: "Difícil"),
                  LevelButton(label: "Perito"),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  crossAxisCount: 2,
                  children: controller.quizzes!
                      .map((e) => QuizCard(
                          onTap: () {
                            Navigator.push(
                                context,
                                Platform.isAndroid
                                    ? MaterialPageRoute(
                                        builder: (context) => ChallengeScreen(
                                              title: e.title,
                                              questions: e.questions,
                                            ))
                                    : CupertinoPageRoute(
                                        builder: (context) => ChallengeScreen(
                                            title: e.title,
                                            questions: e.questions)));
                          },
                          title: e.title,
                          percent: e.questionAnswered / e.questions.length,
                          completed:
                              "${e.questionAnswered} de ${e.questions.length}"))
                      .toList(),
                ),
              )
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }
  }
}
