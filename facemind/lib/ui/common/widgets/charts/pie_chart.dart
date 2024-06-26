import 'package:facemind/utils/global_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../api/model/statistics_data.dart';

class PieChartSample2 extends StatefulWidget {
  List<StressLevelDetail> stressLevel;

  PieChartSample2({
    super.key,
    required this.stressLevel,
  });

  @override
  State<PieChartSample2> createState() => PieChart2State();
}

class PieChart2State extends State<PieChartSample2> {
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: GlobalColors.subBgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const Text(
            '스트레스 지수 통계',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
            textAlign: TextAlign.center,
          ),
          Row(
            children: [
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: PieChart(
                    PieChartData(
                      pieTouchData: PieTouchData(
                        touchCallback: (FlTouchEvent event, pieTouchResponse) {
                          setState(() {
                            if (!event.isInterestedForInteractions ||
                                pieTouchResponse == null ||
                                pieTouchResponse.touchedSection == null) {
                              touchedIndex = -1;
                              return;
                            }
                            touchedIndex = pieTouchResponse
                                .touchedSection!.touchedSectionIndex;
                          });
                        },
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 0,
                      centerSpaceRadius: 40,
                      sections: showingSections(),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Indicator(
                    color: GlobalColors.lightgreenColor,
                    text: '\u{1F606} Lv. 1',
                    isSquare: true,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Indicator(
                    color: GlobalColors.mainColor,
                    text: '\u{1F603} Lv. 2',
                    isSquare: true,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Indicator(
                    color: GlobalColors.darkgreenColor,
                    text: '\u{1F614} Lv. 3',
                    isSquare: true,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Indicator(
                    color: GlobalColors.darkdarkgreenColor,
                    text: '\u{1F616} Lv. 4',
                    isSquare: true,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Indicator(
                    color: GlobalColors.darkgrayColor,
                    text: '\u{1F621} Lv. 5',
                    isSquare: true,
                  ),
                ],
              ),
              const SizedBox(
                width: 28,
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    final List<StressLevelDetail> stressLevel = widget.stressLevel;

    return List.generate(stressLevel.length, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 17.0 : 13.0;
      final radius = isTouched ? 55.0 : 50.0;

      Color backgroundColor = GlobalColors.darkgrayColor;

      switch (stressLevel[i].level) {
        case 1:
          backgroundColor = GlobalColors.lightgreenColor;
        case 2:
          backgroundColor = GlobalColors.mainColor;
        case 3:
          backgroundColor = GlobalColors.darkgreenColor;
        case 4:
          backgroundColor = GlobalColors.darkdarkgreenColor;
        case 5:
          backgroundColor = GlobalColors.darkgrayColor;
        default:
          throw Error();
      }

      return PieChartSectionData(
        color: backgroundColor,
        value: stressLevel[i].percentage.toDouble(),
        title: '${stressLevel[i].percentage}%',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    });
  }
}

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.color,
    required this.text,
    required this.isSquare,
    this.size = 16,
    this.textColor,
  });
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        )
      ],
    );
  }
}
