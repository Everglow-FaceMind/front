import 'package:facemind/utils/global_colors.dart';
import 'package:facemind/widgets/charts/line_chart.dart';
import 'package:facemind/widgets/charts/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AnalyzeView extends StatefulWidget {
  final DateTime date;

  const AnalyzeView({
    super.key,
    required this.date,
  });
  @override
  State<AnalyzeView> createState() => _AnalyzeViewState();
}

class _AnalyzeViewState extends State<AnalyzeView> {
  DateTime date = DateTime.now();

  // https://pub.dev/packages/fl_chart
  // LineChart, PieChart

  @override
  void initState() {
    date = widget.date;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.whiteColor,
      body: Container(
        padding: const EdgeInsets.only(right: 35.0, left: 35.0, bottom: 35.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _header(),
              const SizedBox(height: 20),
              Text(
                '${widget.date.year}',
                style: Theme.of(context).textTheme.labelLarge?.apply(
                      color: GlobalColors.mainColor,
                    ),
              ),
              SizedBox(
                width: 200,
                child: Center(
                  child: Text(
                    '${widget.date.month}월 ${widget.date.day}일, ${DateFormat('E', 'ko_KR').format(widget.date)}요일',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 270,
                child: LineChartSample1(),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                child: PieChartSample2(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _header() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.only(left: 5),
        child: const Text(
          '측정 결과',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      Divider(
        height: 10.0,
        color: Colors.grey[500],
        thickness: 0.8,
      ),
    ],
  );
}
