import 'package:firefit_app/constant.dart';
import 'package:firefit_app/screen/model/iconModel.dart';
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
      false,
    ),
    MyObject(
      "assets/dumbell.png",
      false,
    ),
    MyObject(
      "assets/running.png",
      false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
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
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(gradient: gradientMain),
          child: Column(
            children: [
              Text(
                "Current Progress",
                style: gFontStyle(16, Colors.white),
              ),
              const SizedBox(
                height: 15,
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
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
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
                        "Details",
                        style: gFontStyle(14, Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 20),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: ListView.builder(
                        itemCount: moodIcons.length,
                        shrinkWrap: true,
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                    gradient: moodIcons[index].selected
                                        ? gradientOrange
                                        : gradientGrey,
                                    borderRadius: BorderRadius.circular(10)),
                                width: 100,
                                height: 100,
                                child: Image.asset(
                                  moodIcons[index].icon,
                                  color: moodIcons[index].selected
                                      ? Colors.white
                                      : defaultIcon,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
