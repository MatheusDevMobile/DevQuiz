import 'package:flutter/material.dart';

import 'package:dquiz/core/app_text_styles.dart';
import 'package:dquiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';

class QuestionIndicator extends StatelessWidget {
  final int currentPage;
  final int lenght;

  const QuestionIndicator({
    Key? key,
    required this.currentPage,
    required this.lenght,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Questão $currentPage",
                  style: AppTextStyles.body,
                ),
                Text("de $lenght", style: AppTextStyles.body)
              ],
            ),
            SizedBox(
              height: 16,
            ),
            ProgressIndicatorWidget(value: currentPage / lenght)
          ],
        ),
      ),
    );
  }
}
