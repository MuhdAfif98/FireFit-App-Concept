import 'package:firefit_app/constant.dart';
import 'package:firefit_app/screen/model/iconModel.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class UserProgress extends StatefulWidget {
  const UserProgress({Key? key}) : super(key: key);

  @override
  State<UserProgress> createState() => _UserProgressState();
}

class _UserProgressState extends State<UserProgress> {
  bool isSelected = false;

  List<MyObject> moodIcons = [
    MyObject(
      "assets/cardio.png",
      true,
      "Cardio",
    ),
    MyObject(
      "assets/dumbell.png",
      false,
      "Power",
    ),
    MyObject(
      "assets/running.png",
      false,
      "Endurance",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: gradientMain),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const Icon(Iconsax.arrow_left_2),
          actions: const <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(
                Iconsax.menu_1,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: Column(children: [
          Text(
            "Current Progress",
            style: gFontStyle(16, Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  iconSize: 30,
                  onPressed: () {},
                  icon: Icon(
                    Iconsax.arrow_left_2,
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
                const Spacer(),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.5)),
                    ),
                    Container(
                      width: 220,
                      height: 220,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                    ),
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: SfRadialGauge(
                        enableLoadingAnimation: true,
                        animationDuration: 3000,
                        axes: <RadialAxis>[
                          RadialAxis(
                            axisLineStyle: const AxisLineStyle(
                              cornerStyle: CornerStyle.bothCurve,
                            ),
                            showLabels: false,
                            showTicks: false,
                            minimum: 0,
                            maximum: 100,
                            ranges: <GaugeRange>[
                              GaugeRange(
                                startValue: 0,
                                endValue: 75,
                                color: orange,
                              )
                            ],
                            annotations: <GaugeAnnotation>[
                              GaugeAnnotation(
                                  angle: 90,
                                  positionFactor: 0.9,
                                  widget: Column(
                                    children: [
                                      Text(
                                        "75%",
                                        style: gFontStyle(35, orange),
                                      ),
                                      Text(
                                        "Complete",
                                        style: gFontStyle(12, Colors.grey),
                                      )
                                    ],
                                  ))
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const Spacer(),
                IconButton(
                  iconSize: 30,
                  onPressed: () {},
                  icon: Icon(
                    Iconsax.arrow_right_3,
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              gradient: gradientOrange,
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 50),
                            child: Text(
                              "Workout types",
                              style: gFontStyle(14, Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 120,
                            child: ListView.builder(
                              itemCount: moodIcons.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                Gradient gradient;
                                if (moodIcons[index].selected) {
                                  gradient = gradientOrange;
                                } else {
                                  gradient = gradientGrey;
                                }
                                return InkWell(
                                  onTap: () {
                                    for (int i = 0; i < moodIcons.length; i++) {
                                      if (i == index) {
                                        moodIcons[i].selected =
                                            !moodIcons[i].selected;
                                      } else if (moodIcons[i].selected) {
                                        moodIcons[i].selected = false;
                                      }
                                    }
                                    setState(() {});
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              gradient:
                                                  moodIcons[index].selected
                                                      ? gradientOrange
                                                      : gradientGrey,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          width: 100,
                                          height: 100,
                                          child: Image.asset(
                                            moodIcons[index].icon,
                                            color: moodIcons[index].selected
                                                ? Colors.white
                                                : defaultIcon,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          moodIcons[index].title,
                                          style: moodIcons[index].selected
                                              ? mainStyle(12, Colors.black)
                                              : mainStyle(12, Colors.grey),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),

                        //bar graph sini
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 150,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: const Color(0xff2c4260),
                              child: Container(
                                decoration: BoxDecoration(
                                    gradient: gradientMainHorizontal,
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: _BarChart(),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: FloatingActionButton(
              elevation: 0,
              disabledElevation: 0,
              backgroundColor: orange,
              onPressed: () {},
              child: const Icon(Iconsax.add),
            ),
          ),
        ),
      ),
    );
  }
}

class _BarChart extends StatelessWidget {
  const _BarChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        gridData: FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: 20,
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: const EdgeInsets.all(0),
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Mon';
        break;
      case 1:
        text = 'Tue';
        break;
      case 2:
        text = 'Wed';
        break;
      case 3:
        text = 'Thu';
        break;
      case 4:
        text = 'Fri';
        break;
      case 5:
        text = 'Sat';
        break;
      case 6:
        text = 'Sun';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8.0,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
              toY: 8,
              gradient: gradientOrangeHorizontal,
            )
          ],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
              toY: 10,
              gradient: gradientOrangeHorizontal,
            )
          ],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
              toY: 14,
              gradient: gradientOrangeHorizontal,
            )
          ],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
              toY: 15,
              gradient: gradientOrangeHorizontal,
            )
          ],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [
            BarChartRodData(
              toY: 13,
              gradient: gradientOrangeHorizontal,
            )
          ],
        ),
        BarChartGroupData(
          x: 5,
          barRods: [
            BarChartRodData(
              toY: 10,
              gradient: gradientOrangeHorizontal,
            )
          ],
        ),
        BarChartGroupData(
          x: 6,
          barRods: [
            BarChartRodData(
              toY: 10,
              gradient: gradientOrangeHorizontal,
            )
          ],
        ),
      ];
}
