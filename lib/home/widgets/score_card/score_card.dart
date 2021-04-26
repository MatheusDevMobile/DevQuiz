import 'package:dquiz/core/app_colors.dart';
import 'package:dquiz/core/core.dart';
import 'package:dquiz/home/widgets/chart/chart.dart';
import 'package:flutter/material.dart';

class ScoreCard extends StatelessWidget {
  final double percent;
  const ScoreCard({Key? key, required this.percent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        height: 136,
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: ChartWidget(
                  percent: percent,
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Vamos Começar",
                        style: AppTextStyles.heading,
                      ),
                      Text("Complete os desafios e avance em conhecimento",
                          style: AppTextStyles.body),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
